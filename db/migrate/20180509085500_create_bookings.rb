class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :from_date
      t.date :to_date
      t.integer :customer_id
      t.string :status

      t.timestamps
    end
  end
end
