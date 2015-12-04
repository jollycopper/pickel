class CourseSelectController < ApplicationController
  def search
    if params[:query]
      @courses = Course.where("title LIKE ?", "%#{params[:query][:query_str]}%").paginate(page: params[:page], per_page: 8)
    else
      @courses = Course.paginate(page: params[:page], per_page: 8)
    end
  end

  def query

  end
end
