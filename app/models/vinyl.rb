class Vinyl < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :artist, :release_date, :address, presence: true
end
