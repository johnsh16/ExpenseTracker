class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def logged_in?
        !!session[:user_id]
    end

    def current_user 
        if logged_in?
            @current_user = User.find_by_id(session[:user_id])
            puts "current user" + @current_user.email
        end
    end
end
