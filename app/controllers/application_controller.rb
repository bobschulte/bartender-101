class ApplicationController < ActionController::Base

  before_action :define_error_message

  def current_user
    User.find(session[:current_user_id])
  end

  def define_error_message
    @error_message = flash[:error_message]
  end

  def require_login
    if !session[:current_user_id]
      flash[:error_message] = "Must login to use app."
      redirect_to '/login'
    end
  end
end
