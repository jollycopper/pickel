require 'will_paginate/array'

class CartsController < ApplicationController
  def index
    cart_ids = session[:cart] || []
    puts cart_ids
    @courses = Course.find(cart_ids)
    @courses = @courses.paginate(page: params[:page], per_page: 8)
    @is_cart = true
  end

  def add
    session[:cart] ||= []
    course = Course.find_by(id: params[:id])
    if course and !session[:cart].find_index(course.id)
      session[:cart].append(course.id)
    end
    redirect_to action: 'index'
  end

  def remove
    session[:cart] ||= []
    course = Course.find_by(id: params[:id])
    if course and session[:cart].find_index(course.id)
      session[:cart].delete(course.id)
    end
    redirect_to action: 'index'
  end

  def checkout
    if !session[:cart]
      redirect_to action: 'index'
      return
    end

    succeeded = false
    session[:cart].each do |course_id|
      course = Course.find_by(id: course_id)
      if !current_user.selected?(course)
        current_user.select(course)
        succeeded = true
      end
    end

    if succeeded
      flash[:success] = 'Congratulations! Courses are selected.'
    else
      flash[:danger] = 'Course not added: course already taken by the user'
    end

    session[:cart] = nil
    @courses = []
    redirect_to current_user
  end
end
