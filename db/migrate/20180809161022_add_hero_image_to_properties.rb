class AddHeroImageToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :hero_image, :string
  end
end
