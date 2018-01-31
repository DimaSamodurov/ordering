FactoryBot.define do
  factory :order do
    status 'new'
    subtotal 8
    tax 2
    total 10
    created_at { 1.day.ago }
  end
end
