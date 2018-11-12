class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :img_url
      t.text :instructions
      t.string :glass_type

      t.timestamps
    end
  end
end
