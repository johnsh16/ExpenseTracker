class UserController < ApplicationController
    def index
      @users = User.all
      @email = User.find_by_id(session[:user_id]).email
    end

    def show 
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create 
      @user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])

      if @user.save
        session[:user_id] = @user.id
        redirect_to "/"
      else 
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
