class ReceptionsController < ApplicationController
  def create
    reception = Reception.new(reception_params)
    if reception.save
      respond_to do |format|
        format.html {redirect_to show_ticket_path(current_user)}
        format.js
      end
    end
  end

  private
  def reception_params
    params.require(:reception).permit(:user_id, :viewing_time_id)
  end
end
