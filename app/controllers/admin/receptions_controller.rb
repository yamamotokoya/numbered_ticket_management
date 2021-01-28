class Admin::ReceptionsController < ApplicationController
  def create
    reception = Reception.new(reception_params)
    reception.save
    redirect_to admin_viewing_time_path(reception.viewing_time_id)
  end

  private

    def reception_params
      params.require(:reception).permit(:user_id, :viewing_time_id)
    end
end
