class AddCustomerNameToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :customer_name, :string
    add_column :bookings, :customer_email, :string
    add_column :bookings, :customer_phone, :integer
    add_column :bookings, :room_id, :integer
    add_column :bookings, :hotel_id, :integer
  end
end
