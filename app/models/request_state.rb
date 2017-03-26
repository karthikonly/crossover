class RequestState < ActiveRecord::Base
  has_many  :support_requests
  has_many  :support_logs

  validates_presence_of   :name
end
