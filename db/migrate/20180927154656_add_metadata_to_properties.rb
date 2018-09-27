class AddMetadataToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :meta_title, :string
    add_column :properties, :meta_description, :text
  end
end
