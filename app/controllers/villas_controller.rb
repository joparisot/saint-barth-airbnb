class VillasController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

def index
  # Need to handle the case where only one of the two inputs is filled
  if params[:villa][:start_date] == ""
    @villa = Villa.all
    @villas = Villa.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@villas) do |villa, marker|
      marker.lat villa.latitude
      marker.lng villa.longitude
      marker.infowindow render_to_string(partial: "/villas/map_box", locals: { villa: villa })
    end
  else
    @start_date_search = Date.parse(params[:villa][:start_date])
    @end_date_search = Date.parse(params[:villa][:end_date])
    # Loop through all villas
    @villa = [] #array that will take all the filtered out villas
    @allvillas = Villa.all
    @allvillas.each do |villa|
      @counter = 0
      @villabookings = villa.bookings
      @villabookings.each do |booking|
        if (booking.end_date < @start_date_search && booking.end_date < @end_date_search\
        && booking.start_date < @start_date_search && booking.start_date < @end_date_search )\
        || (booking.end_date > @start_date_search && booking.end_date > @end_date_search\
        && booking.start_date > @start_date_search && booking.start_date > @end_date_search )
          @counter += 1
        end
      end
      @villa << villa if (@counter == villa.bookings.length || villa.bookings.nil?)
    end
    # need to handle question of status (if booking exist but rejected or cancelled, then to be ignored)
    # et le cas ou aucune dispo
  end
end

def show
  @villa = Villa.find(params[:id])
  @hash = Gmaps4rails.build_markers([@villa]) do |villa, marker|
    marker.lat villa.latitude
    marker.lng villa.longitude
    marker.infowindow render_to_string(partial: "/villas/map_box", locals: { villa: villa })
end

def new
  @villa = Villa.new
end

def create
  @villa = Villa.new(villa_params)
  @villa.user = current_user
  @villa.save
  redirect_to villa_path(@villa)
end

def edit
  @villa = Villa.find(params[:id])
end

def update
  @villa = Villa.find(params[:id])
  @villa.update(villa_params)
  redirect_to villa_path(@villa)
end

private

def villa_params
  params.require(:villa).permit(:name, :address, :price, :photo)
end


end
