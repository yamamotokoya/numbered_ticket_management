module UsersHelper
  def current_user
    @current_user = User.find(3)
  end

  def check_user
    current_user.reserved? || current_user.has_viewing_time?
  end

end
