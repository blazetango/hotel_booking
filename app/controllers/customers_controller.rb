class CustomersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @bookings = Booking.where(customer_id: current_user.id)
  end

end