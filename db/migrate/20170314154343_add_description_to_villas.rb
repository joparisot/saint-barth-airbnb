class AddDescriptionToVillas < ActiveRecord::Migration[5.0]
  def change
    add_column :villas, :description, :text
  end
end
