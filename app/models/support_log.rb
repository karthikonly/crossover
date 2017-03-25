class SupportLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :support_request

  validates_presence_of   :content, :user_id, :support_request_id
end
