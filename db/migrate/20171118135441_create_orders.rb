class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :product_code
      t.string :product_name
      t.integer :amount
      t.integer :price
      t.string :note
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
