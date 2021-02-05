class ViewingTimesController < ApplicationController
  before_action :redirect_to_login

  def show_time_table
    @viewing_times = ViewingTime.get_today_schedule 
    respond_to do |f|
      f.html
      f.json { @new_viewing_time = ViewingTime.where("id = ? and capacity < ?", params[:viewing_time][:id], 
      params[:viewing_time][:capacity])}
    end
  end
end
