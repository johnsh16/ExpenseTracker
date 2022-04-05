module HomeHelper
    def logged_in?
        puts !!session[:user_id]
    end

    def current_user 
        if logged_in?
            @current_user = User.find_by_id(session[:user_id])
            puts @current_user
        end
    end
end
