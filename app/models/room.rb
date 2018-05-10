class Room < ApplicationRecord
  belongs_to :hotel
  has_one  :category
  has_many :bookings
end
