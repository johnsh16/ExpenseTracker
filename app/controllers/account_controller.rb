class AccountController < ApplicationController
    def index 
        @accounts = User.find_by(session[:user_id]).accounts
    end

    def show
        #Dunno if id is the best selector for this field...
        @account = Account.find(params[:id])
    end 

    def new 
        @account = Account.new
    end

    def create
        @user = User.find_by(session[:user_id])
        @account
        if !!@user
            @account = @user.account.new(account_params)
        else 
            puts "Not logged in"
        end

        if @account.save
            redirect_to @account
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @account = Account.find(params[:id])
        @account.destroy
    end

    private 

    def account_params
        params.require(:account).permit(:id, :name)
    end

end
