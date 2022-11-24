class BookingsController < ApplicationController
  before_action :set_broomstick, only: %i[new create]

  def show
    @broomsticks = Broomstick.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.broomstick_id = @broomstick.id
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.approved = true
    @booking.save!
    redirect_to my_bookings_path, status: :see_other

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
