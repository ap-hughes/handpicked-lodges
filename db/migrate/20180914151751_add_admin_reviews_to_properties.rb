class AddAdminReviewsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :we_love, :text
    add_column :properties, :guests_love, :text
  end
end
