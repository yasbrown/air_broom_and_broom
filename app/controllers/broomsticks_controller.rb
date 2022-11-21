class BroomsticksController < ApplicationController
  before_action :set_broomstick, only: %i[show destroy]

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
    @broomstick.save
    redirect_to broomsticks_path
  end

  def destroy
    @broomstick.destroy
    redirect_to broomsticks_path, status: :see_other
  end

  private

  def set_broomstick
    @broomstick = Broomstick.find(params[:id])
  end

  def broomstick_params
    params.require(:broomstick).permit(:name, :rating)
  end
end
