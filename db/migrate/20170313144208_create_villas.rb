class CreateVillas < ActiveRecord::Migration[5.0]
  def change
    create_table :villas do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.float :price
      t.integer :number_of_guests
      t.integer :number_of_beds
      t.string :category
      t.boolean :pool
      t.boolean :heated_pool
      t.integer :number_of_bathrooms
      t.integer :number_of_rooms
      t.time :arrival_time
      t.boolean :jacuzzi
      t.boolean :parking
      t.boolean :wifi
      t.boolean :smoking_allowed

      t.timestamps
    end
  end
end
