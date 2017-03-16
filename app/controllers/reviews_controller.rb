class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = params[:booking_id]
    @review.user = current_user
    @villa = @review.villa
    @review.save
    redirect_to villa_path(@villa)
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.booking_id = params[:booking_id]
    @villa = @review.villa
    @review.update(review_params)
    redirect_to villa_path(@villa)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
