class Broomstick < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  validates :speed, presence: true
  validates :speed, numericality: { only_integer: true }
  validates :speed, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }

  validates :stability, presence: true
  validates :stability, numericality: { only_integer: true }
  validates :stability, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }

  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 1000 }

  has_many :users, through: :bookings
end
