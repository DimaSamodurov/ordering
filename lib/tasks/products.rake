require 'net/http'
require 'net/https'
require 'json'
require 'open-uri'
require 'adapters/products'

namespace :products do
  desc "Update product list"
  task update: :environment do
    products = Adapters::Products.get_products('http://95.46.99.242/WRO/hs/orders/productlist/')

    puts "Updating #{products.count} products"
    puts products

    ProductImporter.import(products)
  end
end
