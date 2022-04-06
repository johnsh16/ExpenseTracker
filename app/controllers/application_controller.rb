class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    attr_accessor :current_email, :currentuser

    def logged_in?
        !!session[:user_id]
    end

    def current_user 
        if logged_in?
            @current_user = User.find_by_id(session[:user_id])
        end
    end
end
