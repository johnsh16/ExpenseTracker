class HomeController < ApplicationController
    def home
        @logged_in = helpers.logged_in?
        if @logged_in
            @current_user = current_user
            @current_email = @current_user.email
        end
        
    end

    def data 
        @user = User.find_by_id(session[:user_id])
        @accountsObj = helpers.accountObj
        render :json => @accountsObj
    end
end
