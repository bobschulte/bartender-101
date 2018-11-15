class IngredientsController < ApplicationController
    before_action :define_current_ingredient
    before_action :require_login

    def create
        Ingredient.create(ingredient_params)
        redirect_to ingredients_path
    end

    def index
      if params[:search]
        @ingredients = Ingredient.where("name like ?", "%#{params[:search]}%").order(:name)
      else
        @ingredients = Ingredient.all.order(:name)
      end
    end

    def update
        @ingredient.update(ingredient_params)
        redirect_to @ingredient
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
