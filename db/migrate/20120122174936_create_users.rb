class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :facebook_uid
      t.integer :ratings_count, :default => 0, :null => false
      t.string :name, :null => false
      t.timestamps
    end
    
    add_index :users, :facebook_uid, :unique => true
  end
end
