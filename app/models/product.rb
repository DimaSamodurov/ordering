class Product < ApplicationRecord
  has_many :order_items
  
  def price_list
    ProductPrice.for(name)
  end
end
