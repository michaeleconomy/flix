class ImportController < ApplicationController
  before_filter :require_login, :only => [:index]
  before_filter :require_netflix_login, :only => [:index]
  
  def index
    
  end
  
  def add_movies
    if signed_in_netflix? && signed_in?
      process_user_ratings
    end
    render :file => "app/assets/images/pixel.png", :content_type => "image/png"
  end
  
  
  private
  
  def process_user_ratings
    ids = params[:ids].split(" ").collect{|id| id[2..-3]}
    resource_urls = ids.collect{|id| "http://api.netflix.com/catalog/titles/#{id}"}
    api_url = "/users/#{netflix_auth_data[:user_id]}/ratings/title/actual?title_refs=#{CGI::escape resource_urls.join(",")}"
    nf_response = current_netflix_access_token.get(api_url)
    parsed_ratings = NetflixParser.parse(nf_response.body)
    current_user.import_ratings parsed_ratings
  end
  
end