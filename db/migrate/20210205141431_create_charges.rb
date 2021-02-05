class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.string :fs_charge_id
      t.string :total
      t.boolean :completed
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
