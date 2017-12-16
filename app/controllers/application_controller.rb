class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order

  def current_order
    result = Order.new_orders.where(id: session[:order_id]).first if session[:order_id]
    result || Order.new
  end


end
