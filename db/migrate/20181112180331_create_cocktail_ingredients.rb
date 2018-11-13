class CreateCocktailIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktail_ingredients do |t|
      t.string :measurement
      t.belongs_to :cocktail, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
