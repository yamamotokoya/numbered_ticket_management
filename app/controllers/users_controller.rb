class UsersController < ApplicationController
  before_action :redirect_to_login, only: [:show, :edit]
  before_action :collect_user, only: [:show, :edit, :update]
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login user
      redirect_to time_table_path, flash: {
        messages: {
          success: '会員登録しました'
        }
      }
    else
      redirect_back fallback_location: root_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, flash: {
        messages: {
          success: '会員情報を更新しました'
        }
      }
    else
      redirect_back fallback_location: time_table_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  def collect_user
    @user = User.find(params[:id])
    if is_current_user?(@user) || current_user.admin?
      @user
    else
      redirect_to time_table_path, flash: {
        messages: {
          danger: '他のユーザーのページは閲覧できません'
        }
      }
    end
  end


end
