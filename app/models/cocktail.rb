class Cocktail < ApplicationRecord
  has_many :cocktail_ingredients, dependent: :destroy
  has_many :ingredients, through: :cocktail_ingredients
  has_many :user_favorite_cocktails
  has_many :users, through: :user_favorite_cocktails
  accepts_nested_attributes_for :cocktail_ingredients

  validates :name, presence: true, uniqueness: true
  validate :duplicate_ingredient?

  def duplicate_ingredient?
    id_array = []

    self.cocktail_ingredients.each do |cocktail_ingredient|
        id_array << cocktail_ingredient.ingredient_id
    end
    # byebug
    check = id_array.detect{ |e| id_array.count(e) > 1 }

    if !check.nil?
      errors.add(:cocktail_ingredient, "cannot be duplicated")
    end
  end

end
