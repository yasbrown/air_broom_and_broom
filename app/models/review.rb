class Review < ApplicationRecord
  belongs_to :broomstick

  validates :content, presence: true
end
