class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews
  has_attachment :photo
  validates :name, uniqueness: :true, allow_blank: :false, presence: :true
end
