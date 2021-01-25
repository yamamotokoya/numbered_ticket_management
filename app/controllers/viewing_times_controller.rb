class ViewingTimesController < ApplicationController

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

  private

  def viewing_time_params
    params.require(:viewing_time).permit(:hold_at, :program_name, :capacity)
  end
end
