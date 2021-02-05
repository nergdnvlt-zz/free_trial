class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :fs_order_id
      t.string :total
      t.boolean :completed
      t.string :product
      t.string :product_path
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
