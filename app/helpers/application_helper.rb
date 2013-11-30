module ApplicationHelper
  def require_role(role)
    current_user.has_role?(role)
  end
end
