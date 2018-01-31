class ProductPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :product_prices do |t|
      t.string :product_name
      t.decimal :price, precision: 12, scale: 3
      t.datetime :effective_date
      t.timestamps
    end
  end
end
