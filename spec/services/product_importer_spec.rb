require 'rails_helper'

RSpec.describe ProductImporter do

  describe '.import(products)' do
    let(:new_products) {
      products_json = <<~JSON
      [
            {
            "title": "Продукт №1",
            "description": "Опис продукта №1"
            },
            {
            "title": "Продукт №2",
            "description": "Опис продукта №2"
            },
            {
            "title": "Продукт №3",
            "description": "Опис продукта №3"
            },
            {
            "title": "Продукт №4",
            "description": "Опис продукта №4"
            }
      ]
      JSON
      JSON.parse(products_json)
    }

    it 'adds new records to the list of Products' do
      ProductImporter.import(new_products)

      expect(Product.count).to eql new_products.count
      new_products.each do |new_product|
        expect(Product.find_by(name: new_product['title'])).to be_present
      end
    end

    it 'cleans up all old products' do
      old_products = [Product.create(name: 'old1'), Product.create(name: 'old2')]

      ProductImporter.import(new_products)

      expect(Product.count).to eql new_products.count
      old_products.each do |old_product|
        expect(Product.find_by(name: old_product.name)).to be_nil
      end
    end
  end
end
