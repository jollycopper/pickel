class CourseSelectController < ApplicationController
  before_action :logged_in_user, only: [:search]

  def search
    if params[:query]
      query_str = params[:query][:query_str]
      query_year = params[:query][:query_str].to_i
      @courses = Course
                     .where("title LIKE ? OR instructor LIKE ? OR description LIKE ? OR year = ?", "%#{query_str}%", "%#{query_str}%", "%#{query_str}%", "#{query_year}")
                     .paginate(page: params[:page], per_page: 8)
    else
      @courses = Course.paginate(page: params[:page], per_page: 8)
    end
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
