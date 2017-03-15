class UsersController < ApplicationController
  def show
    @user = current_user
    @villas = Villa.where(user_id: @user.id)
    villas_id = []
    @villas.each do |villa|
      villas_id << villa.id
    end
    @bookings = Booking.where(user_id: @user.id)
    @bookings_as_a_host = Booking.where(villa_id: @villas)
    # need to find a way to say bookings where villa_id belongs to all the ids from @villas (which are my villas)
  end
end
