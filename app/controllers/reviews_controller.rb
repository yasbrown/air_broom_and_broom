class ReviewsController < ApplicationController
  before_action :set_broomstick, only: %i[new create edit update]
  before_action :set_review, only: %i[edit update destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.broomstick = @broomstick
    @review.user = current_user
    if @review.save
      redirect_to broomstick_path(@broomstick)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to broomstick_path(@broomstick)
  end

  def destroy
    @review.destroy
    redirect_to broomstick_path(@review.broomstick), status: :see_other
  end

  private

  def set_broomstick
    @broomstick = Broomstick.find(params[:broomstick_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
