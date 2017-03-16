class VillasController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

def index
  @villa = Villa.all
  @villas = Villa.where.not(latitude: nil, longitude: nil)

  @hash = Gmaps4rails.build_markers(@villas) do |villa, marker|
        marker.lat villa.latitude
        marker.lng villa.longitude
        marker.infowindow render_to_string(partial: "/villas/map_box", locals: { villa: villa })
      end
end

def show
  @villa = Villa.find(params[:id])
  @reviews = @villa.reviews
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
