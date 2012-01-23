class Rating < ActiveRecord::Base
  belongs_to :movie, :counter_cache => true
  belongs_to :user, :counter_cache => true
end
