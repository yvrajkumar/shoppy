json.extract! order, :id, :order_id, :product_id, :email, :quantity, :status, :cost, :created_at, :updated_at
json.url order_url(order, format: :json)
