class ProductImporter

  def self.import(products)
    Product.delete_all
    products.each do |product|
      Product.create(name: product['title'])
    end
  end

end
