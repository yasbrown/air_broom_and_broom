class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :broomstick

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
