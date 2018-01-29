class ProductsController < ApplicationController

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
        redirect_to product_path(@product.id)
        end

end
    private

    def product_params
      params.require(:product).permit(:price, :name, :previous_prices, :time_to_price)
    end


end
