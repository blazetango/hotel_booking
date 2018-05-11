class Booking < ApplicationRecord
  #belongs_to :room

  validates :from_date, inclusion: { in: (Date.today..Date.today+6.months) }
  validates :to_date, inclusion: { in: (Date.today..Date.today+6.months) }
  validate :date_checks
  validates :customer_email,  presence: true
  before_save :check_customer_registered

  private

  def date_checks
    if to_date < from_date
      errors.add(:to_date, "to date must be greater than from date")
    end
  end

  def check_customer_registered
    customer = User.find_by_email(self.customer_email)
    if customer.present?
      self.customer_id = customer.id
    end
  end
end
