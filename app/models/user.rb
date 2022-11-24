class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :broomsticks, through: :bookings, dependent: :destroy
  has_many :bookings
  has_many :users, through: :broomsticks

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
