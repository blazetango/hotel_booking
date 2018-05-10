class Customer < User

  after_create :update_booking_with_registered_customer


  private
  def update_booking_with_registered_customer
    bookings = Booking.where(customer_email: self.email).where(customer_id: nil)
    bookings.update_all(customer_id: self.id)
  end

end
