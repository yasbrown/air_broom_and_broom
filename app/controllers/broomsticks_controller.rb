class BroomsticksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_broomstick, only: %i[show edit update destroy]

  def index
    if params[:q].present?
      @broomsticks = Broomstick.search_by_name_and_address_location(params[:q])
      if @broomsticks.nil?
        @broomsticks = Broomstick.all
      end
    else
      @broomsticks = Broomstick.all
    end

    @markers = @broomsticks.geocoded.map do |broomstick|
      {
        lat: broomstick.latitude,
        lng: broomstick.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @markers = [{ lat: @broomstick.latitude, lng: @broomstick.longitude }]
    @review = Review.new
  end

  def new
    @broomstick = Broomstick.new
  end

  def create
    @broomstick = Broomstick.new(broomstick_params)
    @broomstick.name = @broomstick.name.downcase.capitalize
    @broomstick.user = current_user
    if @broomstick.save!
      redirect_to broomstick_path(@broomstick)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @broomstick.update(broomstick_params)
    redirect_to broomstick_path(@broomstick)
  end

  def destroy
    @broomstick.destroy!
    redirect_to broomsticks_path, status: :see_other
  end

  private

  def set_broomstick
    @broomstick = Broomstick.find(params[:id])
  end

  def broomstick_params
    params.require(:broomstick).permit(:name, :speed, :stability, :price, :address, :description, :photo, :search_by_address, :search_by_name)
  end
end
