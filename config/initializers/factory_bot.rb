if Rails.env.test? || Rails.env.development? 
  FactoryBot.find_definitions
end
