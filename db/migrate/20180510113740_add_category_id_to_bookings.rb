class AddCategoryIdToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :category_id, :integer
  end
end
