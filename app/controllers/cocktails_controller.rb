class CocktailsController < ApplicationController

    before_action :define_current_cocktail

    def create
        # byebug
        @cocktail = Cocktail.new(cocktail_params)

        cocktail_params["cocktail_ingredients_attributes"].each do |num, attributes|
            @cocktail.cocktail_ingredients.create(attributes)
        end

        if @cocktail.valid?
            @cocktail.save
            redirect_to cocktail_path(@cocktail)
        else
            render :new
        end
    end

    def new
      if params["num_ingredients"]
          @ingredient_count = params["num_ingredients"]
      else
          @ingredient_count = 3
      end
      @ingredients = Ingredient.all

      @ingredient_count.times do
        @cocktail.cocktail_ingredients.new
      end
    end

    def index
        @cocktails = Cocktail.all.order(:name)
    end

    def update
        @cocktail.update(cocktail_params)
        redirect_to @cocktail
    end

    def destroy
        @cocktail.destroy
        redirect_to cocktails_path
    end

    def define_current_cocktail
        if params[:id]
            @cocktail = Cocktail.find(params[:id])
        else
            @cocktail = Cocktail.new
        end
    end

    def cocktail_params
        params.require(:cocktail).permit(:name, :img_url, :instructions, :glass_type, cocktail_ingredients_attributes: [ [ :ingredient_id, :measurement ] ] )
    end
end
