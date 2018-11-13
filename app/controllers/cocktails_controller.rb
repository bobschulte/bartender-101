class CocktailsController < ApplicationController

    before_action :define_current_cocktail

    def create
        @cocktail = Cocktail.new(cocktail_params)

        if @cocktail.valid?
            @cocktail.save
            redirect_to cocktail_path(@cocktail)
        else
            flash[:notice] = @cocktail.errors.messages
            render :new
        end

    end

    def new
      ingredient_count(params).times do
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

    def ingredient_count(params)
        if params["num_ingredients"]
            params["num_ingredients"].to_i
        else
            3
        end
    end

    def cocktail_params
        params.require(:cocktail).permit(:name, :img_url, :instructions, :glass_type, cocktail_ingredients_attributes: [ [ :ingredient_id, :measurement ] ] )
    end
end
