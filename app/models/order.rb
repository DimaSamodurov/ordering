class Order < ApplicationRecord
  has_many :order_products

  attr_accessor :code, :order_product_code, :customer_code, :customer_name, :contractor_code, :contractor_name, :user, :user_id
end
