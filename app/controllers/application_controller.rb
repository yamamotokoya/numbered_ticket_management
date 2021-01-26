class ApplicationController < ActionController::Base
  include UsersHelper
  before_action :current_user
end
