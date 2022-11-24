class ReviewsController < ApplicationController
  before_action :set_broomstick, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.broomstick = @broomstick
    if @review.save
      redirect_to broomstick_path(@broomstick)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to broomstick_path(@review.broomstick), status: :see_other
  end

  private

  def set_broomstick
    @broomstick = Broomstick.find(params[:broomstick_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
