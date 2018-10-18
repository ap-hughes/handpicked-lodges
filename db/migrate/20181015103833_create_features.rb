class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :name
      t.boolean :key
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
