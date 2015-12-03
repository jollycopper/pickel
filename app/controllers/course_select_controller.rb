class CourseSelectController < ApplicationController
  def search
    @courses = Course.paginate(page: params[:page], per_page: 10)
    # @courses = Course.all
  end
end
