class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  add_flash_types :success, :info, :danger, :warning

  def redirect_to_login
    redirect_to login_path, danger: "ログインしてください" unless logged_in?
  end


end
