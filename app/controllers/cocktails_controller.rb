class CocktailsController < ApplicationController

    before_action :define_current_cocktail

    def create
        @cocktail = Cocktail.new(cocktail_params)

        if @cocktail.valid?
            @cocktail.save
            session[:cocktail_attributes] = {}
            redirect_to cocktail_path(@cocktail)
        else
            session[:cocktail_attributes] = cocktail_params
            flash[:notice] = build_error_msg(@cocktail.errors.messages, "create")
            redirect_to new_cocktail_url
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
        @cocktail.assign_attributes(cocktail_params)

        if @cocktail.valid?
            @cocktail.save
            redirect_to cocktail_path(@cocktail)
        else
            flash[:notice] = build_error_msg(@cocktail.errors.messages, "edit")
            redirect_to cocktail_path(@cocktail)
        end
    end

    def destroy
        @cocktail.destroy
        redirect_to cocktails_path
    end

    def define_current_cocktail
        session[:cocktail_attributes] ||= {}
        session[:cocktail_attributes] = {} if params["num_ingredients"]
        if params[:id]
            @cocktail = Cocktail.find(params[:id])
        else
            @cocktail = Cocktail.new(session[:cocktail_attributes])
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
        params.require(:cocktail).permit(:name, :img_url, :instructions, :glass_type, cocktail_ingredients_attributes: [ [ :id, :ingredient_id, :measurement ] ] )
    end

    def build_error_msg(messages, verb)
        str = "Could not #{verb} cocktail. "
        messages.each do |attribute, msg|
            str << "#{attribute.to_s.split("_").join(" ").capitalize} #{msg[0]}. "
        end
        str
    end

end
