class AddDateToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :date, :string
  end
end
