class Product < ApplicationRecord
include ProductsHelper  

  has_many :order_items

  def price_list
    ProductPrice.for(name)
  end

  def self.price_list
    ProductPrice.for(name)

  end


end
