class Cocktail < ApplicationRecord
  has_many :cocktail_ingredients, dependent: :destroy
  has_many :ingredients, through: :cocktail_ingredients
  accepts_nested_attributes_for :cocktail_ingredients

  validates :name, presence: true, uniqueness: true
  # validate :two_ingredients?
  #
  # def two_ingredients?
  #   self.ingredients.length >= 2
  # end
end
