json.extract! support_request, :id, :title, :created_at, :updated_at
json.url customer_url(support_request, format: :json)
json.creator_name     support_request.creator.fullname
json.product_name     support_request.product.name
json.request_state    support_request.request_state.name
json.handler_name     hide_agent_name(support_request.handler)
json.support_logs support_request.support_logs do |support_log|
  json.content        support_log.content
  json.user           hide_agent_name(support_log.user)
  json.request_state  support_log.request_state.name
end