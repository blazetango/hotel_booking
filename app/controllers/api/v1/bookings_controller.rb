class Api::V1::BookingsController < Api::V1::ApiController
  #before_action :authenticate_user!

  def rooms_are_available
    booking = Booking.where(from_date: params[:fromDate], to_date: params[:toDate], category_id: params[:categoryId]).count
    total_room_of_category = Category::ROOM_COUNT_CATEG_WISE[params[:categoryId].to_i]
    bookings_available = total_room_of_category - booking
    if bookings_available > 0
      render json: {message: " #{bookings_available} rooms available" }
    else
      render json: {message: 'rooms not available' }
    end
  end
 end
