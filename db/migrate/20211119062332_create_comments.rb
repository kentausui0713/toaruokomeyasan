class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :customer_id, null: false
      t.integer :item_id, null: false
      t.text :comment, null: false
      t.float :rate, null: false, default: 0

      t.timestamps
    end
  end
end
