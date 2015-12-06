class CourseSelectController < ApplicationController
  before_action :logged_in_user, only: [:search]

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

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
