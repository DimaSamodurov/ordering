class OrderProduct < ApplicationRecord
  belongs_to :order


  attr_accessor :product_code, :product_name, :amount, :price, :order, :order_id

end
