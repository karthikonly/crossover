json.extract! support_request, :id, :title, :creator_id, :product_id, :request_state_id, :created_at
json.url customer_url(support_request, format: :json)
