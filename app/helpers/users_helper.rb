module UsersHelper
  def check_user
    !current_user.reserved? || !current_user.reserved_today?
  end


end
