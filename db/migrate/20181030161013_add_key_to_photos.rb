class AddKeyToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :key, :boolean
  end
end
