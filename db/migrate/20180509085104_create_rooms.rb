class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :room_no
      t.integer :category_id
      t.string :status

      t.timestamps
    end
  end
end
