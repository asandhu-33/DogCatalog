class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:shelter)

    # Keyword search on breed name
    if params[:search].present?
      @breeds = @breeds.where("name LIKE ?", "%#{params[:search]}%")
    end

    # Filter by selected shelter
    if params[:shelter_id].present?
      @breeds = @breeds.where(shelter_id: params[:shelter_id])
    end

    # Paginate results
    @breeds = @breeds.page(params[:page]).per(12)
  end

  def show
    @breed = Breed.find(params[:id])
  end
end