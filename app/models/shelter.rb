class Shelter < ApplicationRecord
  # Dependent destroy ensures associated breeds are automatically removed if the shelter is deleted
  has_many :breeds, dependent: :destroy

  validates :name, :city, :email, presence: true
  validates :email, uniqueness: true
end