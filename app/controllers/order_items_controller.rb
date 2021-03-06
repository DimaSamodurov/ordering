class OrderItemsController < ApplicationController


  def create
    @order = current_order
    @order.user_id = current_user.id
    @order.save!
    session[:order_id] = @order.id
    @order_item = @order.order_items.new(order_item_params)
    @order_item.user_id = current_user.id
    @order_item.save!

  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :user_id, :order_id)
  end
end
