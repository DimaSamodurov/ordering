class ProductsController < ApplicationController

  def charts
    @product = Product.all
     render layout: nil
  end

end
