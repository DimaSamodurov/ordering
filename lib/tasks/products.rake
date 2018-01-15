require 'product_importer'
namespace :products do
  desc "Update product list"
  task update: :environment do
    products = get_products_from_service(nil)
    puts "Updating #{products.count} products"

    puts products

    ProductImporter.import(products)

  end

  def get_products_from_service(url)
    string = <<~JSON
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

    JSON.parse string
  end
end
