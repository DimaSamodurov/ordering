class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :code
      t.string :order_num
      t.string :customer_code
      t.string :customer_name
      t.string :contractor_code
      t.string :contractor_name
      t.string :note
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
