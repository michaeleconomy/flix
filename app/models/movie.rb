class Movie < ActiveRecord::Base
  has_many :ratings, :dependent => :destroy
  has_many :users, :through => :ratings
  
  def netflix_url
    return nil unless netflix_id
    "http://movies.netflix.com/Movie/#{title.gsub(/\W/, "_")}/#{netflix_id}"
  end
  
  %w(tiny small large).each do |size|
    define_method("#{size}_image_url") do
      image_url(size)
    end
  end
  
  
  def display_name
    title
  end
  
  
  def self.get_from_data(data)
    movie = find_or_initialize_by_netflix_id data[:netflix_id]
    movie.title ||= data[:title]
    movie.length ||= data[:length]
    movie.mpaa_rating ||= data[:mpaa_rating]
    if data[:release_at]
      movie.release_at = data[:release_at]
      movie.release_at_accuracy = data[:release_at_accuracy]
    end
    movie.save!
    movie
  end
  
  private
  
  def image_url(size)
    return nil unless netflix_id
    "http://cdn-1.nflximg.com/en_us/boxshots/#{size}/#{netflix_id}.jpg"
  end
end
