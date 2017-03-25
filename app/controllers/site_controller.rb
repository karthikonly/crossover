class SiteController < ApplicationController
  def index
    redirect_to new_user_session_path, alert: "Sign in or Sign up before proceeding" unless user_signed_in?
    redirect_to customers_path if current_user.customer?
    redirect_to support_requests_path if current_user.agent?
    redirect_to support_requests_path if current_user.admin?
  end
end
