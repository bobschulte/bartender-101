class CocktailsController < ApplicationController
    before_action :define_current_cocktail
    
    def create
        Cocktail.create(cocktail_params)
        redirect_to cocktails_path
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
        params.require(:cocktail).permit(:name, :img_url, :instructions, :glass_type)
    end
end
