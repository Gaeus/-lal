class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hideout
  has_many :booking

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence:true, length: { maximum: 30 }
  validates :picture, presence: true

end
