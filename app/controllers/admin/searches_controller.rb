class Admin::SearchesController < ApplicationController
  def index
    @users = User.where("name LIKE(?)", "%#{params[:name]}%")
    respond_to do |format|
      format.html {redirect_to admin_users_path}
      format.json {render 'index', handlers: 'jbuilder'}
    end
  end
end