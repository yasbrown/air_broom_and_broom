class BroomsticksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_broomstick, only: %i[show edit update destroy]

  def index
    @broomsticks = Broomstick.all
  end

  def show
  end

  def new
    @broomstick = Broomstick.new
  end

  def create
    @broomstick = Broomstick.new(broomstick_params)
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
    params.require(:broomstick).permit(:name, :speed, :stability, :price)
  end
end
