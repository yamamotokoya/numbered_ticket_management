class UsersController < ApplicationController
  before_action :logged_in_user?, only: :show
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login user
      redirect_to time_table_path, success: '会員登録しました'
    else
      redirect_back fallback_location: root_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @user
    else
      redirect_to time_table_path, danger: '他のユーザーのページは閲覧できません'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user?
    redirect_to login_path, danger: 'ログインまたは会員登録してください' unless logged_in?
  end

end
