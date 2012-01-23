class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionStuff
  
  def current_netflix_access_token
    return nil unless netflix_auth_data
    netflix_access_token(netflix_auth_data[:token], netflix_auth_data[:secret])
  end
  
  
  private
  
  def netflix_access_token(oauth_token, oauth_token_secret)
    consumer = OAuth::Consumer.new(NETFLIX_KEY, NETFLIX_SECRET,
        :site => "http://api.netflix.com")
    token_hash = { :oauth_token => oauth_token,
      :oauth_token_secret => oauth_token_secret }
    OAuth::AccessToken.from_hash(consumer, token_hash)
  end
end
