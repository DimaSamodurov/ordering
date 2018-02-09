require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '.price_list' do
    it 'returns list of prices of product specified by parameter' do
      #prepare data
      Product.create(name: 'apple', price: 3)
      ProductPrice.create(product_name: 'apple', price: 19, effective_date: 1.day.ago)

      #perform actions

      list = Product.price_list('apple')

      #evaluate results
      expect(list.first.price).to eql 19
    end
  end

  describe '#price_list' do
    it 'returns list of current product prices' do
      #prepare data
      product = create :product
      ProductPrice.create(product_name: product.name, price: 7, effective_date: "2018-01-01")
      ProductPrice.create(product: product, price: 8, effective_date: 2.month.ago)
      ProductPrice.create(product: product, price: 9, effective_date: 3.month.ago)

      #perform actions

      list = product.price_list

      #evaluate results
      expect(list.size).to eql 3
      expect(list.first.price). to eql 7


    end
    it 'doesnt return prices of other products'  do
      product_first = create :product
      ProductPrice.create(product_name: product_first.name, price: 7, effective_date: "2018-01-01")
      ProductPrice.create(product: product_first, price: 8, effective_date: 2.month.ago)
      ProductPrice.create(product: product_first, price: 9, effective_date: 3.month.ago)

      list_first = product_first.price_list

      product_second = Product.create(name: 'bread', price: 2)
      ProductPrice.create(product: product_second, price: 4, effective_date: 2.month.ago)
      ProductPrice.create(product: product_second, price: 5, effective_date: 3.month.ago)

        list_second = product_second.price_list

        expect(list_first).not_to eql(list_second)


    end

  end
end
