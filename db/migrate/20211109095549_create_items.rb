class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image_id, null: false
      t.integer :price, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
