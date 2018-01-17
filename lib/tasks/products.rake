require 'net/http'
require 'net/https'
require 'json'
require 'open-uri'

namespace :products do
  desc "Update product list"
  task update: :environment do
    products = get_products_from_service('http://95.46.99.242/WRO/hs/orders/productlist/')

    puts "Updating #{products.count} products"
    puts products

    ProductImporter.import(products)
  end

  def get_products_from_service(url)
    uri      = URI.parse(url)
    http     = Net::HTTP.start(uri.host, uri.port,
                               :use_ssl => uri.scheme == 'https',
                               :verify_mode => OpenSSL::SSL::VERIFY_NONE)
    request  = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    json     = JSON.load(response.body)
  end
end
