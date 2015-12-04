class CourseSelectController < ApplicationController
  def search
    if params[:query]
      query_str = "\"%#{params[:query][:query_str]}%\""
      @courses = Course
                     .where("title LIKE #{query_str} or instructor like #{query_str} or description like #{query_str}")
                     .paginate(page: params[:page], per_page: 8)
    else
      @courses = Course.paginate(page: params[:page], per_page: 8)
    end
  end
end
