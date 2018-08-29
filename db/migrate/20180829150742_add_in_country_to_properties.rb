class AddInCountryToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :in_country, :boolean
  end
end
