class SupportRequest < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', inverse_of: 'created_requests'
  belongs_to :handler, class_name: 'User', inverse_of: 'handled_requests'
  belongs_to :product
  belongs_to :request_state

  has_many   :support_logs

  validates_presence_of   :title, :creator_id, :product_id, :request_state_id
end
