class VillasController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # Need to handle the case where only one of the two inputs is filled
    if params[:villa][:start_date] == "" || params[:villa][:end_date] == ""
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
      @villa = []
      @allvillas = Villa.all
      @allvillas.each do |villa|
        @counter = 0
        @villabookings = villa.bookings.where(status: ["Approved", "Pending", "pending"])
        @villabookings.each do |booking|
          if (booking.end_date < @start_date_search && booking.end_date < @end_date_search\
          && booking.start_date < @start_date_search && booking.start_date < @end_date_search )\
          || (booking.end_date > @start_date_search && booking.end_date > @end_date_search\
          && booking.start_date > @start_date_search && booking.start_date > @end_date_search )
            @counter += 1
          end
        end
        @villa << villa if (@counter == @villabookings.length || @villabookings.nil?)
      end
      # Need to handle case where no villa is available at the dates
    end

    @villas_to_display_on_map_not_filtered = Villa.where.not(latitude: nil, longitude: nil)
    @villas_to_display_on_map_filtered = []
    @villas_to_display_on_map_not_filtered.each do |villa|
      @villas_to_display_on_map_filtered << villa if @villa.include?(villa)
    end
    @hash = Gmaps4rails.build_markers(@villas_to_display_on_map_filtered) do |villa, marker|
      marker.lat villa.latitude
      marker.lng villa.longitude
      marker.infowindow render_to_string(partial: "/villas/map_box", locals: { villa: villa })
    end
    # Need to handle case where no villa is available at the dates

  end


  def show
    @start_date_search = params[:villa][:start_date]
    @end_date_search = params[:villa][:end_date]
    @villa = Villa.find(params[:id])
    @booking = Booking.new
    @reviews = @villa.reviews
    @hash = Gmaps4rails.build_markers([@villa]) do |villa, marker|
      marker.lat villa.latitude
      marker.lng villa.longitude
      marker.infowindow render_to_string(partial: "/villas/map_box", locals: { villa: villa })
    end
  end

  def new
    @villa = Villa.new
  end

  def create
    # need to put an if if all the validations don't go through
    @villa = Villa.new(villa_params)
    @villa.user = current_user
    if @villa.save
      redirect_to villa_path(@villa)
    else
      render 'new'
    end
  end

  def edit
    @villa = Villa.find(params[:id])
    @user = @villa.user_id
  end

  def update
    @villa = Villa.find(params[:id])
    @villa.update(villa_params)
    redirect_to villa_path(@villa)
  end

  def destroy
    @villa = Villa.find(params[:id])
    @villa.destroy
    redirect_to villas_path
  end

  private

  def villa_params
    params.require(:villa).permit(:name, :address, :price, :number_of_guests, :number_of_beds, :category, :pool, :heated_pool,
    :number_of_bathrooms, :number_of_rooms, :arrival_time, :jacuzzi, :parking, :wifi, :smoking_allowed, :description, :photo, images: [])
  end
end
