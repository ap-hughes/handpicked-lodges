class RemoveFeaturesFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :features, :text
  end
end
