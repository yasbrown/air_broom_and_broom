class Broomstick < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :speed, presence: true
  validates :stability, presence: true
  validates :price, presence: true

  has_many :users, through: :bookings
end
