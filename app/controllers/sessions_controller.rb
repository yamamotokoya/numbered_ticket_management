class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to time_table_path, info: "ログインしました"
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to login_path, warning: "ログアウトしました"
  end
end
