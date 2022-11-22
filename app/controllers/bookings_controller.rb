class BookingsController < ApplicationController
  before_action :set_broomstick, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = User.first.id
    @booking.broomstick_id = @broomstick.id
    @booking.save
    redirect_to broomstick_path(@broomstick)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to broomstick_path(@booking.broomstick), status: :see_other
  end

  private

  def set_broomstick
    @broomstick = Broomstick.find(params[:broomstick_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
