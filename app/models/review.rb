class Review < ApplicationRecord
  belongs_to :broomstick
  belongs_to :user

  validates :content, presence: true
end
