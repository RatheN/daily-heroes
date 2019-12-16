class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !!current_user
    end
    
    def authorize
        redirect_to '/' if !logged_in?
    end
end