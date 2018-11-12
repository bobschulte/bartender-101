class IngredientsController < ApplicationController
    before_action :define_current_ingredient
    
    def create
        Ingredient.create(ingredient_params)
        redirect_to ingredients_path
    end
    
    def index
        @ingredients = Ingredient.all
    end
    
    def update
        @ingredient.update(ingredient_params)
        redirect_to @ingredient
    end
    
    def destroy
        @ingredient.destroy
        redirect_to ingredients_path
    end
    
    def define_current_ingredient
        if params[:id]
            @ingredient = Ingredient.find(params[:id])
        else
            @ingredient = Ingredient.new
        end
    end
    
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end


