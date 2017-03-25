json.extract! support_request, :id, :title, :creator_id, :handler_id, :product_id, :request_state_id, :created_at
json.url agent_url(support_request, format: :json)
