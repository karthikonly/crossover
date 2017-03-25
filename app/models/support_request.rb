class SupportRequest < ActiveRecord::Base
  attr_accessor :description
  attr_accessor :current_user

  belongs_to :creator, class_name: 'User', inverse_of: 'created_requests'
  belongs_to :handler, class_name: 'User', inverse_of: 'handled_requests'
  belongs_to :product
  belongs_to :request_state

  has_many   :support_logs, dependent: :destroy

  validates_presence_of   :title, :creator_id, :product_id, :request_state_id

  after_save do
    unless description.blank? || current_user.nil?
      self.support_logs.create(content: self.description, user_id: current_user.id)
      self.current_user = nil
      self.description = nil
    end
  end
end
