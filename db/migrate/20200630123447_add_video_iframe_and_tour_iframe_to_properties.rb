class AddVideoIframeAndTourIframeToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :video_iframe, :string
    add_column :properties, :tour_iframe, :string
  end
end
