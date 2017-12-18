RSpec::Matchers.define :show_orders do
  match do |page|
    page.has_selector?('table.orders')
  end
end


