json.extract! order, :id, :user_id, :note, :product_code, :amount, :price, :created_at, :updated_at
json.url order_url(order, format: :json)
