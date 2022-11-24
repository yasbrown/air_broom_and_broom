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

  has_one_attached :photo


  include PgSearch::Model
  pg_search_scope :search_by_name_and_address_location,
  against: [ :name, :address, :latitude, :longitude],
  using: {
  tsearch: { prefix: true }
  }

  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


end
