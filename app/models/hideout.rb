class Hideout < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :cover_picture
  has_many_attached :pictures

  validates :user, presence: true
  validates :address, presence: true, length: { in: 1..150 }, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :overview, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { in: 1..150 } # , uniqueness: true /Gaeus : disabled for testing
  # validates :cover_picture, presence: true
end
