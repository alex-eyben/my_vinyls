class Booking < ApplicationRecord
  belongs_to :vinyl
  belongs_to :user
  validates :date_begin, :date_end, presence: true
end
