class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :villa
  validates :number_of_guests, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_guests, presence: true
end
