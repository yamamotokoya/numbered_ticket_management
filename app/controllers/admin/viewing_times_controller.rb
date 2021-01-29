class Admin::ViewingTimesController < ApplicationController
  before_action :admin_user?
  before_action :set_viewing_time, only: [:show, :edit, :update, :destroy, :not_checked_in]
  before_action :initialize_reception, only: [:show, :not_checked_in]

  def index
    @viewing_times = ViewingTime.all
  end

  def show
    @users = User.paginate(User.find_users(@viewing_time), params[:page])
    @searched_users = User.paginate(searched_users, params[:page]) if params[:user_name]
  end
  
  def not_checked_in
    @users = User.paginate(@viewing_time.not_checked_in_users, params[:page])
  end

  def new
    @viewing_time = ViewingTime.new
  end

  def create
    @viewing_time = ViewingTime.new(viewing_time_params)
    if @viewing_time.save
      redirect_to admin_viewing_times_path, flash: {
        messages: {
          success: "新しい観覧回を作成しました"
        }
      }
    else
      redirect_back fallback_location: admin_viewing_times_path, flash: {
        viewing_time: @viewing_time,
        error_messages: @viewing_time.errors.full_messages
      }
    end
  end

  def edit
  end

  def update
    if @viewing_time.update(viewing_time_params)
      redirect_to admin_viewing_time_path(@viewing_time), flash: {
        messages: {
          success: "観覧回の情報を更新しました"
        }
      }
    else
      redirect_back fallback_location: admin_viewing_times_path, flash: {
        viewing_time: @viewing_time,
        error_messages: @viewing_time.errors.full_messages
      }
    end
  end

  def destroy
    @viewing_time.destroy
    @viewing_time.users_viewing_time_id_delete
    redirect_to admin_viewing_times_path, flash: {
      messages: {
        warning: "1件観覧回を削除しました"
      }
    } 
  end

  def today_viewing_time
    @viewing_times = ViewingTime.get_today_schedule
  end

  private

    def viewing_time_params
      params.require(:viewing_time).permit(:hold_at, :program_name, :capacity)
    end

    def set_viewing_time
      @viewing_time = ViewingTime.find(params[:id])
    end

    def initialize_reception
      @reception = Reception.new
    end

    def searched_users
      User.search(@viewing_time, params[:user_name])
    end
end
