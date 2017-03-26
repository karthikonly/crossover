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

  before_validation do
    self.role_id ||= 2
  end

  def admin?
    self.role_id == 1
  end

  def customer?
    self.role_id == 2
  end

  def agent?
    self.role_id == 3
  end
end
