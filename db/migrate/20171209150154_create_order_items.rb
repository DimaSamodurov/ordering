class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :item_code
      t.string :item_name
      t.integer :amount
      t.integer :price
      t.belongs_to :order, index: true

      t.timestamps
    end
  end
end
