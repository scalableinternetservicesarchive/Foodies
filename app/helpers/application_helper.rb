module ApplicationHelper
  def cache_key_for_application_header(current_user)
    current_user == nil ? "current_user-none" : "current_user-#{current_user.id}"
  end
end
