class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :villa, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests
      t.string :status

      t.timestamps
    end
  end
end
