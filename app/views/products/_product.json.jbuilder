json.extract! product, :id, :beverage_id, :inventory_id, :created_at, :updated_at
json.url product_url(product, format: :json)
