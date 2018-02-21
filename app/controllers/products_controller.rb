class ProductsController < ApplicationController

  def charts
    @product = Product.find_by(params[:name]) 
     render layout: nil
  end

end
