class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :code
      t.integer :order_item_code
      t.integer :customer_code
      t.string :customer_name
      t.integer :contractor_code
      t.string :contractor_name
      t.datetime :create_at
      #t.string :message
      #t.integer :order_product_id, index: true
      t.integer :user_id, index: true


      t.timestamps
    end
  end
end
