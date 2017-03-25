class Product < ActiveRecord::Base
  has_many  :support_requests, dependent: :destroy
  
  validates_presence_of   :name
end
