class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :netflix_id
      t.integer :length
      t.integer :ratings_count, :default => 0, :null => false
      t.date :release_at
      t.string :release_at_accuracy
      t.string :title, :null => false
      t.text :description
      t.string :mpaa_rating
      
      t.timestamps
    end
    add_index :movies, :title
    add_index :movies, :netflix_id, :unique => true
  end
end
