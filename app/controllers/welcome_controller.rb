class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @client_orders = Order.where(user_id: current_user.id)
    end
  end
end
