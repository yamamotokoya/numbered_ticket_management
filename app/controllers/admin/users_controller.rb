class Admin::UsersController < ApplicationController
  before_action :admin_user?
  before_action :collect_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, flash: {
        messages: {
          success: "会員情報を登録しました"
        }
      }
    else
      redirect_back fallback_location: admin_users_path, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, flash: {
        messages: {
          success: "#{@user.name}様の会員情報を更新しました"
        }
      }
      else
      redirect_back fallback_location: admin_users_path, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, flash: {
      messages: {
        warning: "会員情報を削除しました"
      }
    }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :viewing_time_id)
  end


  def collect_user
    @user = User.find(params[:id])
  end
end
