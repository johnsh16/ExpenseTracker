class SessionsController < ApplicationController
    def create
        @user = User.find_by! email:params[:email]

        puts params

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts "logged in"
            redirect_to "/user/#{@user.id}"
        else 
            flash.alert = "User not found"
            puts "not found"
            message = "Error in login..."
            redirect_to "/user/login", notice: message
        end
    end
end