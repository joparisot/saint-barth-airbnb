class Villa < ApplicationRecord
  belongs_to :user
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attachment :photo
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
