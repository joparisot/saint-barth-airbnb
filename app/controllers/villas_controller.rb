class VillasController < ApplicationController

def new
  @villa = Villa.new
end

def create

  @villa = Villa.new(villa_params)
  @villa.user = current_user
  @villa.save
  redirect_to villa(@villa)
end

private

def villa_params
  params.require(:villa).permit(:name, :address, :price)
end

end


