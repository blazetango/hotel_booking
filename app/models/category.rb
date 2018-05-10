class Category < ApplicationRecord
  belongs_to :room

  ROOM_COUNT_CATEG_WISE = { 1 => 20, 2 => 20, 3 => 12, 4 => 8 }
end
