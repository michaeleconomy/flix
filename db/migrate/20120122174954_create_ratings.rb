class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, :null => false
      t.references :movie, :null => false
      t.integer :rating
      t.timestamps
    end
  end
end
