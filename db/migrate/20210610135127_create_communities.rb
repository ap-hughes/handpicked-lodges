class CreateCommunities < ActiveRecord::Migration[5.2]
  # Client wants to be able to update single records on their Seasgair Community page
  # Only create one row for this table, they can edit / update it.
  def change
    create_table :communities do |t|
      t.string :childrens_forest_trees
      t.string :seasgair_trees
      t.string :eden_reforestation_trees
      t.string :donation
      t.string :rewilding_sponsorship

      t.timestamps
    end
  end
end
