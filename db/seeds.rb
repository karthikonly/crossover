require 'ffaker'

SEED = {
  role: [
    [{id: 1, name: "Admin"},{}],
    [{id: 2, name: "Customer"},{}],
    [{id: 3, name: "Agent"},{}]
  ],
  user: [
    [{email: "admin@service.com", role_id: 1}, {password: "admin1234", password_confirmation: "admin1234", fullname: "Administrator"}],
    [{email: "customer@service.com", role_id: 2}, {password: "cust1234", password_confirmation: "cust1234", fullname: "Customer"}],
    [{email: "agent@service.com", role_id: 3}, {password: "agent1234", password_confirmation: "agent1234", fullname: "Agent"}]
  ],
  request_state: [
    [{id: 1, name: "Opened"},{}],
    [{id: 2, name: "InProgress"},{}],
    [{id: 3, name: "NeedsInformation"},{}],
    [{id: 4, name: "Closed"},{}],
    [{id: 5, name: "Deleted"},{}],
  ],
  product: [
    [{name: "Laptop"},{}],
    [{name: "Fridge"},{}],
    [{name: "Washing Machine"},{}],
    [{name: "Stove"},{}],
    [{name: "Microwave"},{}],
    [{name: "Induction Stove"},{}],
    [{name: "Toaster"},{}],
    [{name: "Grill"},{}],
    [{name: "Blender"},{}],
    [{name: "Egg Beater"},{}],
  ]
}

def seed_data
  SEED.each do |model_name, value_hash_arrays|
    value_hash_arrays.each do |value_hash_array|
      instance = model_name.to_s.classify.constantize.find_or_initialize_by(value_hash_array[0])
      instance.update(value_hash_array[1])
      puts "errors: #{model_name}:#{instance.errors.messages}" unless instance.save
    end
  end
end

def seed_support_request
  customers = User.where(role_id: 2)
  customers.each do |customer|
    (5+rand(5)).times do
      sr = SupportRequest.new
      sr.title = FFaker::DizzleIpsum.phrase
      sr.creator = customer
      sr.request_state = RequestState.find(1)
      sr.product = Product.order("RAND()").first
      sr.handler = nil
      puts "errors: Support Request:#{sr.errors.messages}" unless sr.save
    end
    (10+rand(10)).times do
      sr = SupportRequest.where(creator_id: customer.id).order("RAND()").first
      agent = User.where(role_id: 3).order("RAND()").first
      request_log = SupportLog.create(support_request_id: sr.id, agent_id: agent.id, content: FFaker::DizzleIpsum.sentence)
      sr.request_state = RequestState.find(2+rand(3))
      sr.handler = agent
      puts "errors: Support Request:#{sr.errors.messages}" unless sr.save
    end
  end
end

seed_data
seed_support_request