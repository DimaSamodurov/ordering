class OrderItem < ApplicationRecord
  belongs_to :order


  attr_accessor :item_code, :item_name, :amount, :price, :order, :order_id

end
