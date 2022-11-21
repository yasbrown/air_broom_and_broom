class Broomstick < ApplicationRecord
  validates :name, presence: true
  validates :rating, presence: true
end
