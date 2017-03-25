class SupportLog < ActiveRecord::Base
  belongs_to :agent
  belongs_to :support_request

  validates_presence_of   :content, :agent_id, :support_request_id
end
