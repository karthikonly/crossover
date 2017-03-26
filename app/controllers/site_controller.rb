class SiteController < ApplicationController
  def index
    redirect_to new_user_session_path, alert: "Sign in or Sign up before proceeding" unless user_signed_in?
    redirect_to customers_path if current_user.customer?
    redirect_to agents_path if current_user.agent?
    redirect_to support_requests_path if current_user.admin?
  end

  def report
    redirect_to :root, alert: "Unauthorized Access" unless current_user.agent? || current_user.admin?
    @support_requests = SupportRequest.where(request_state_id: 4).order(updated_at: :desc)
  end
end
