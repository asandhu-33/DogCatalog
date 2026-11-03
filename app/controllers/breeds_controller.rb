class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:shelter).all
  end

  def show
    @breed = Breed.find(params[:id])
  end
end