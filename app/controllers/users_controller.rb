class UsersController < ApplicationController
    before_action :define_current_user
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def create
        user = User.new(user_params)

        if user.valid?
            user.save
            session[:current_user_id] = user.id
            redirect_to '/login'
        else
            flash[:error_message] = build_error_msg(user.errors.messages, 'register')
            redirect_to new_user_path
        end
    end

    def index
        @users = User.all
    end

    def update
        @user.update(user_params)
        redirect_to @user
    end

    # def destroy
    #     @user.destroy
    #     redirect_to users_path
    # end

    def define_current_user
        if params[:id]
            @user = User.find(params[:id])
        else
            @user = User.new
        end
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end

    def build_error_msg(messages, verb)
        str = "Could not #{verb} user. "
        messages.each do |attribute, msg|
            str << "#{attribute.to_s.split("_").join(" ").capitalize} #{msg[0]}. "
        end
        str
    end

end
