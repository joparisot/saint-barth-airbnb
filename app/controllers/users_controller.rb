class UsersController < ApplicationController
  def show
    @user = current_user
    @villas = Villa.where(user_id: @user.id)
    villas_id = []
    @villas.each do |villa|
      villas_id << villa.id
    end
    @bookings = Booking.where(user_id: @user.id)
    @bookings_as_a_host = Booking.where(villa_id: villas_id)
    # I take bookings where villa_id belongs to all the ids from @villas (which are my villas)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
