class Booking < ApplicationRecord
  #belongs_to :room

  validates :from_date, inclusion: { in: (Date.today..Date.today+6.months) }
  validates :to_date, inclusion: { in: (Date.today..Date.today+6.months) }
  before_save :check_customer_registered

  private

  def check_customer_registered
    customer = User.find_by_email(self.customer_email)
    if customer.present?
      self.customer_id = customer.id
    end
  end
end
