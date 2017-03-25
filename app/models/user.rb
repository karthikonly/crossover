class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to  :role

  has_many   :created_requests, class_name: 'SupportRequest', foreign_key: 'creator_id'
  has_many   :handled_requests, class_name: 'SupportRequest', foreign_key: 'handler_id'
  has_many   :support_logs

  validates_presence_of     :fullname, :role_id, :email

  def customer?
    self.role.name == 'Customer'
  end

  def agent?
    self.role.name == 'Agent'
  end

  def admin?
    self.role.name =='Admin'
  end
end
