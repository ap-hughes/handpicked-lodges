class AddFloorplanToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :floorplan, :string
  end
end
