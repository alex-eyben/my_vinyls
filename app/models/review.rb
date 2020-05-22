class Review < ApplicationRecord
  belongs_to :vinyl
  validates :content, presence: true
end
