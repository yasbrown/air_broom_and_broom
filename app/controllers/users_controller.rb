class UsersController < ApplicationController

  def show
    @user = current_user
    @broomstick = Broomstick.find(params[:broomstick_id])
    @booking = Booking.find(params[:booking_id])
  end

end
