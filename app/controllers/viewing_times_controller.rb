class ViewingTimesController < ApplicationController
  before_action :redirect_to_login
  before_action :check_admin, only: [:index, :new, :create]
  before_action :set_time_table, only: :show_time_table
  before_action :available_user?, only: :reserve

  def index
    @viewing_times = ViewingTime.all
  end

  def new
    @viewing_time = ViewingTime.new
  end

  def create
    @viewing_time = ViewingTime.new(viewing_time_params)
    if @viewing_time.save
      redirect_to viewing_times_path
    else
      redirect_back fallback_location: root_path, flash: {
        viewing_time: @viewing_time,
        error_messages: @viewing_time.errors.full_messages
      }
    end
  end

  def show_time_table
  end

  def reserve
    viewing_time = ViewingTime.find(params[:id])
    current_user.reserved(viewing_time)
    viewing_time.decrease_capacity
    redirect_to time_table_path, success: "#{viewing_time.program_name}の回を予約しました"
  end

  private

  def viewing_time_params
    params.require(:viewing_time).permit(:hold_at, :program_name, :capacity)
  end

  def set_time_table
    @viewing_times = ViewingTime.get_today_schedule
  end

  def available_user?
    redirect_to root_path unless check_user
  end

  def check_admin
    redirect_to time_table_path, danger: '管理者のみに与えられた権限です' unless admin_user?
  end


end
