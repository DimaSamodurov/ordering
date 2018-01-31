FactoryBot.define do
  factory :order_item do
    product { create :product }
  end
end
