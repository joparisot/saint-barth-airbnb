class VillasController < ApplicationController
  def index
    @villa = Villa.all
  end

  def show
    @villa = Villa.find(params[:id])
  end
end
