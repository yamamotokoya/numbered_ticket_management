class ViewingTimesController < ApplicationController
  before_action :redirect_to_login

  def show_time_table
    @viewing_times = ViewingTime.get_today_schedule
  end
end
