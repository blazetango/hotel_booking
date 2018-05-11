class Booking < ApplicationRecord
  #belongs_to :room
  belongs_to :category
  
  validates :from_date, inclusion: { in: (Date.today..Date.today+6.months) }
  validates :to_date, inclusion: { in: (Date.today..Date.today+6.months) }
  validate :date_checks
  validate :room_check
  validates :customer_email, :customer_name,  presence: true
  before_save :check_customer_registered

  def self.get_room_count(from_date, to_date, category_id)
    fd =from_date.to_date.strftime('%Y-%m-%e')
    td = (to_date.to_date + 1.day).strftime('%Y-%m-%e')
    where("category_id = ? AND ((from_date) BETWEEN ? AND ? OR (to_date) BETWEEN ? AND ? )", category_id, fd,td,fd,td).count
  end

  private

  def room_check
    booking = Booking.get_room_count( from_date, to_date, category_id)

    total_room_of_category = Category::ROOM_COUNT_CATEG_WISE[category_id.to_i]
    bookings_available = total_room_of_category - booking
    if bookings_available <= 0
      errors.add( :to_date, "Rooms Not available in this time range")
    end
  end

  def date_checks
    if to_date < from_date
      errors.add(:to_date, "End date must be greater than start date")
    end
  end

  def check_customer_registered
    customer = User.find_by_email(self.customer_email)
    if customer.present?
      self.customer_id = customer.id
    end
  end
end
