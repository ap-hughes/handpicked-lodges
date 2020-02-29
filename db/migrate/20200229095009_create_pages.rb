class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :meta_title
      t.text :meta_description

      t.timestamps
    end
  end
end
