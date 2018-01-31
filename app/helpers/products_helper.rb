module ProductsHelper

  def product_prices(name)
    head = [
      ['Date', 'Price'],
    ]

    prices = ProductPrice.for(name).map{|product| [product.effective_date.iso8601, product.price.to_f] }

    head + prices
  end
end
