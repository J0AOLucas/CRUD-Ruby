json.extract! product, :id, :purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name, :created_at, :updated_at
json.url product_url(product, format: :json)
