module SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:user_id)
  end

  def redirect_to_login
    redirect_to login_path, flash: {
      messages: {
        danger: "ログインまたは会員登録してください" 
      }
    } unless logged_in?
  end

  def is_current_user?(user)
    user == current_user
  end



end
