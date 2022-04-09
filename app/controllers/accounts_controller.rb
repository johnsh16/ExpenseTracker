class AccountsController < ApplicationController
    def index 
        #@user = User.find_by_id(session[:user_id])
        @accounts = User.find_by_id(session[:user_id]).accounts
    end

    def show
        @account = Account.find_by_id(params[:id])
        @transactions = @account.transactions
    end 

    def new 
        @account = Account.new
    end

    def create
        self.new
        @user = User.find_by_id(session[:user_id])
        #@user.accounts.new(name: account_params[:name])
        @account = Account.new(name: account_params[:name], user_id: @user.id)

        if @account.save
            redirect_to @account
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
        @account = Account.find_by_id(params[:id])
    end 

    def update
        @account = Account.find_by_id(params[:id])
        @account.update(name: account_params[:name], account_type: account_params[:account_type])

        if @account.save
            redirect_to "/accounts/#{params[:id]}"
        else 
            render :edit
        end
    end

    def destroy
        @account = Account.find(params[:id])
        @account.destroy
    end

    private 

    def account_params
        params.require(:account).permit(:name, :account_type, :user_id)
    end

end
