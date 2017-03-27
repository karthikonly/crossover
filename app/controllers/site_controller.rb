class SiteController < ApplicationController
  layout 'react_layout', only: [:react_index]

  def index
    redirect_to customers_path if current_user.customer?
    redirect_to agents_path if current_user.agent?
    redirect_to support_requests_path if current_user.admin?
  end

  def report
    redirect_to :root, alert: "Unauthorized Access" unless current_user.agent? || current_user.admin?
    @support_requests = SupportRequest.includes(:creator, :handler, :product, :request_state, support_logs: :user).
      where(request_state_id: 4).where('updated_at > ?', 1.month.ago).order(updated_at: :desc)
  end

  def react_index
  end
end
