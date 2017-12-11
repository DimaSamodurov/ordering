class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.integer :product_code
      t.string :product_name
      t.integer :amount
      t.integer :price
      t.integer :order_id, index: true

      t.timestamps
    end
  end
end
