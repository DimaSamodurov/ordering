class Order < ApplicationRecord
  has_many :order_items

  attr_accessor :code, :order_item_code, :customer_code, :customer_name, :contractor_code, :contractor_name, :user, :user_id
end
