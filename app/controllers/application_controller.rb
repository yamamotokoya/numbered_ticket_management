class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  add_flash_types :success, :info, :danger, :warning

  def admin_user?
    redirect_to root_path unless current_user.admin?
  end

end
