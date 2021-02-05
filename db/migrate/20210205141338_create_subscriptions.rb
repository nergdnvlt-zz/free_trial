class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :fs_sub_id
      t.string :product
      t.string :product_path
      t.boolean :active
      t.string :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
