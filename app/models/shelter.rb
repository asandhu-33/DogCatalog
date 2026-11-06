class Shelter < ApplicationRecord
  has_many :breeds, dependent: :destroy

  validates :name, :city, :email, presence: true
  validates :email, uniqueness: true
end