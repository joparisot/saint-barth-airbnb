class VillasController < ApplicationController
def index
  @villa = Villa.all
end

def show
  @villa = Villa.find(params[:id])
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
