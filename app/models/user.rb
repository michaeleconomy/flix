class User < ActiveRecord::Base
  has_many :ratings, :dependent => :destroy
  has_many :movies, :through => :ratings
  
  def image_url
    "http://graph.facebook.com/#{facebook_uid}/picture?type=square"
  end
  
  def display_name
    name
  end
  
  def import_ratings(ratings_data)
    ratings_data.each do |rating_data|
      movie = Movie.get_from_data(rating_data[:movie])
      next unless movie
      r = ratings.find_or_initialize_by_movie_id(movie.id)
      r.rating = rating_data[:rating]
      r.save!
    end
  end
end
