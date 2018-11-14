class SessionsController < ApplicationController
    
    before_action :login_error_message
    
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            redirect_to cocktails_path
        else
            flash[:error_message] = "Wrong Login Information"
            redirect_to new_session
        end
    end

    def login_error_message
        @error_message = flash[:error_message]
    end
end
