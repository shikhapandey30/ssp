json.extract! product, :id, :name, :description, :sub_category_type_id, :price, :full_price, :image, :status, :created_at, :updated_at
json.url product_url(product, format: :json)
