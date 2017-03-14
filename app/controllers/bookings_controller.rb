class BookingsController < ApplicationController
  def new
    @villa = Villa.find(params[:villa_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.villa_id = params[:villa_id]
    @booking.status = "pending"
    @booking.save
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_guests)
  end
end
