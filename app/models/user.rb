class User < ApplicationRecord
  # Include default devise modules. Others available are:
  include PgSearch::Model
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hideouts
  has_many :bookings
  has_one_attached :avatar

  validates :nickname, presence: true, length: { maximum: 30 }
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence:true, length: { maximum: 30 }

  multisearchable against: [:nickname, :first_name, :last_name]
end
