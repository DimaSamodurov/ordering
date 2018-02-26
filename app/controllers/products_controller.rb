class ProductsController < ApplicationController

  def charts
    @products = Product.all
     render layout: nil
  end

end
