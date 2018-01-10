class WelcomeController < ApplicationController

  def index
  end

  def test
    @orders = current_user.orders
      respond_to do |format|
     format.html
     format.js
    end
#end
end
end
