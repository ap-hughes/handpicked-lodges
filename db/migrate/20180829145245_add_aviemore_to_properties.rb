class AddAviemoreToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :in_aviemore, :boolean
  end
end
