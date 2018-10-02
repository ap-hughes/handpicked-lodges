class AddGamesRoomToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :games_room, :boolean
  end
end
