class SessionsController < ApplicationController
  
  def create_netflix
    auth_data = request.env['omniauth.auth']
    session[:netflix] = {}
    netflix_auth_data[:token] = auth_data["credentials"]["token"]
    netflix_auth_data[:secret] = auth_data["credentials"]["secret"]
    netflix_auth_data[:user_id] = auth_data["uid"]
    
    redirect_to my_movies_path
  end
  
  
  def create_facebook
    auth_data = request.env['omniauth.auth']
    user = User.find_or_initialize_by_facebook_uid(auth_data[:uid])
    if user.new_record?
      user.name = auth_data[:info][:name]
      user.save!
      new_user = true
    end
    session[:user_id] = user.id
    
    redirect_to new_user ? import_path : my_movies_path
  end
  
  def failure
    
  end
end