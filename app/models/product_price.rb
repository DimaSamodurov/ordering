class ProductPrice < ApplicationRecord

  scope :for, ->(name) { where(product_name: name) }

  scope :at, ->(specific_date) { order(effective_date: :desc).where('effective_date < ?', specific_date).first }

end
