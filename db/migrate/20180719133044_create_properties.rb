class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :code
      t.boolean :enabled
      t.string :name
      t.integer :sleeps
      t.string :headline
      t.text :description
      t.decimal :min_daily_price, precision: 6, scale: 2
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :wood_stove
      t.boolean :hot_tub
      t.boolean :pet_friendly
      t.boolean :sauna
      t.text :features

      t.timestamps
    end
  end
end
