module ApplicationHelper
  def hide_agent_name(user)
    return user unless user
    return "Agent" if user.admin? || user.agent?
    return user.fullname
  end
end
