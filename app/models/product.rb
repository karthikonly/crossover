class Product < ActiveRecord::Base
  has_many  :support_requests
  
  validates_presence_of   :name
end
