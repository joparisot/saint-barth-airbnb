class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_notifs


  def set_notifs
    if current_user
      villas = current_user.villas
      @notifs = 0
      villas.each do |villa|
        villa.bookings.each do |booking|
          @notifs+=1 if booking.status == "Pending"
        end
      end
    end
  end
end
