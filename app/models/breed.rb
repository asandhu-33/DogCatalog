class Breed < ApplicationRecord
  belongs_to :shelter

  validates :name, :life_span, :image_url, presence: true
end