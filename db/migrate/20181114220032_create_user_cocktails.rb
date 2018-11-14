class CreateUserCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cocktails do |t|
      t.belongs_to :user
      t.belongs_to :cocktail

      t.timestamps
    end
  end
end
