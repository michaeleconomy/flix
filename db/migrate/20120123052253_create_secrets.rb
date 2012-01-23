class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.string :key
      t.string :value
    end
  end
end
