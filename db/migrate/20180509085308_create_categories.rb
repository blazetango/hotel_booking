class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :bed_type
      t.string :side_facing
      t.boolean :gym
      t.float :tarrif

      t.timestamps
    end
  end
end
