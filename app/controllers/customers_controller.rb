class CustomersController < ApplicationController
  before_action :authenticate_user!
  # before_action :is_admin_user?

  def dashboard
    @bookings = Booking.where(customer_id: current_user.id)
  end

  private

  # def is_admin_user?
  #   if current_user.type != 'Admin'
  #     redirect_to dashboard_path
  #   end
  # end

end