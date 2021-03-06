class Villa < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, :through => :bookings
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # has_attachment :photo
  has_attachments :images, maximum: 30
  # validates :images, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
