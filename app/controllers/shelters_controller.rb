class SheltersController < ApplicationController
  def index
    @shelters = Shelter.order(:name).page(params[:page]).per(10)
  end

  def show
    @shelter = Shelter.find(params[:id])
    @breeds = @shelter.breeds.page(params[:page]).per(12)
  end
end