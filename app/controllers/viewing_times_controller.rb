class ViewingTimesController < ApplicationController
  before_action :redirect_to_login
  before_action :available_user?, only: :reserve

  def show_time_table
    @viewing_times = ViewingTime.get_today_schedule
  end

  def reserve
    viewing_time = ViewingTime.find(params[:id])
    current_user.reserved(viewing_time)
    viewing_time.decrease_capacity
    redirect_to time_table_path, flash: {
      messages: {
        success: "#{viewing_time.program_name}の回を予約しました"
      }
    }
  end

  private

    def available_user?
      redirect_to root_path unless check_user
    end
end
