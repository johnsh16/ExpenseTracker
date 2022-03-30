class UserController < ApplicationController
    def index
      @users = User.all
    end

    def show 
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create 
      @user = User.new(first_name:"...", last_name:"...", email:"...", password:"...")

      if @user.save
          redirect_to @user
      else 
          render :new, status: :unprocessable_entity
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end

    def addAccount
      @user = User.find(params[:id])
      @account = Account.find(params[:id])
      @user.accounts += @account
    end
  end
end
