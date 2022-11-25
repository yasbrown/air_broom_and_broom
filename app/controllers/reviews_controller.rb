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
    respond_to do |format|
      if @review.save
        format.html { redirect_to broomstick_path(@broomstick) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "broomsticks/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
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
