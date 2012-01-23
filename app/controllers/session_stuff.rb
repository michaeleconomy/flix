module SessionStuff
  
  def require_login
    return true if signed_in?
    redirect_to '/auth/facebook'
    return false
  end
  
  def require_netflix_login
    return true if signed_in_netflix?
    redirect_to '/auth/netflix'
    return false
  end
  
  
  def signed_in?
    current_user_id.present?
  end
  
  def current_user_id
    session[:user_id]
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    
    @current_user = signed_in? && User.find_by_id(current_user_id)
  end
  
  def signed_in_netflix?
    netflix_auth_data.present?
  end
  
  def sign_out!
    session.clear
    redirect_to "/"
  end
  
  def netflix_auth_data
    session[:netflix]
  end
  
end