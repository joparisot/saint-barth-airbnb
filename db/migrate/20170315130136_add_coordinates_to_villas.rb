class AddCoordinatesToVillas < ActiveRecord::Migration[5.0]
  def change
    add_column :villas, :latitude, :float
    add_column :villas, :longitude, :float
  end
end
