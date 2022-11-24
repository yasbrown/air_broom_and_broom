class BookingsController < ApplicationController
  before_action :set_broomstick, only: %i[new create]

  def show
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.broomstick = @broomstick
    @booking.save
    redirect_to my_bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  private

  def set_broomstick
    @broomstick = Broomstick.find(params[:broomstick_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
