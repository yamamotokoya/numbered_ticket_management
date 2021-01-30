class ReceptionsController < ApplicationController
  def create
    reception = Reception.new(reception_params)
     reception.save
      redirect_to show_ticket_path(current_user)
  end

  private
  def reception_params
    params.require(:reception).permit(:user_id, :viewing_time_id)
  end
end
