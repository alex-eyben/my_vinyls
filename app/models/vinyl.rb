class Vinyl < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :title, :artist, :release_date, :address, presence: true
end
