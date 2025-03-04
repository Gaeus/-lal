class Hideout < ApplicationRecord
  has_many :booking
  belongs_to :user

  validates :user, presence: true
  validates :address, presence: true, length: { in: 1..50 }, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :overview, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: { in: 1..50 }, uniqueness: true
  validates :cover_picture, presence: true
end
