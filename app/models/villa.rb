class Villa < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
