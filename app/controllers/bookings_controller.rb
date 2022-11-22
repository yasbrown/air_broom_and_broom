class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end
  def create
    @broomstick = Broomstick.find(params[:broomstick_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
