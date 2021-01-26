class UsersController < ApplicationController
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
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
