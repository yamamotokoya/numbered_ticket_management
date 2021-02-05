class ReservationController < ApplicationController
  before_action :redirect_to_login
  before_action :available_user?
  before_action :set_viewing_time, only: :create

  def create
    current_user.reserved(@viewing_time)
    respond_to do |format|
      format.html { redirect_to time_table_path, flash: { messages: { 
                    success: "#{@viewing_time.program_name}の回を予約しました"}}}
      format.js
    end
  end

  private 

  def set_viewing_time
    @viewing_time = ViewingTime.find(params[:viewing_time_id])
  end

  def available_user?
    redirect_to root_path unless check_user
  end
end
