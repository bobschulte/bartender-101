class UserCocktailsController < ApplicationController
    before_action :define_current_user_cocktail
    
    def create
        User_Cocktail.create(user_cocktail_params)
        redirect_to user_cocktails_path
    end
    
    def index
        @user_cocktails = User_Cocktail.all
    end
    
    def update
        @user_cocktail.update(user_cocktail_params)
        redirect_to @user_cocktail
    end
    
    def destroy
        @user_cocktail.destroy
        redirect_to user_cocktails_path
    end
    
    def define_current_user_cocktail
        if params[:id]
            @user_cocktail = User_Cocktail.find(params[:id])
        else
            @user_cocktail = User_Cocktail.new
        end
    end
    
    def user_cocktail_params
        params.require(:user_cocktail).permit(:user_id, :cocktail_id)
    end
end
