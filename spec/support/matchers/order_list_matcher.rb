RSpec::Matchers.define :show_orders do | *orders |
  match do |page|
    orders.all? do |order|
      page.has_selector?("table.orders tr#order_#{order.id}")
    end
  end
end


