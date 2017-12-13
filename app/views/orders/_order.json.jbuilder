json.extract! order, :id, :user_id, :note, :product_code, :product_name, :amount, :price, :created_at, :updated_at
json.url order_url(order, format: :json)
