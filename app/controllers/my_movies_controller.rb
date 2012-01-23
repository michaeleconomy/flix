class MyMoviesController < ApplicationController
  before_filter :require_login, :only => [:my_movies]
  
  def index
    @ratings = current_user.ratings.
      includes(:movie).
      order('rating DESC, id desc').
      paginate(:page => params[:page], :per_page => 50)
  end
  
end