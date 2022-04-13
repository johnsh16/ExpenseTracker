class AccountsController < ApplicationController
    def index 
        #@user = User.find_by_id(session[:user_id])
        @accounts = User.find_by_id(session[:user_id]).accounts
    end

    def show
        @account = Account.find_by_id(params[:id])
        @transactions = @account.transactions
    end 

    def hidden 
        @accounts = User.find_by_id(session[:user_id]).accounts
    end

    def new 
        @account = Account.new
    end

    def filter 
        @account = Account.find_by_id(params[:id])
        #@all_transactions = @account.transactions
        @func = nil
        case params[:func]
        when "filter_byGroup"
            puts 'ding'
            @func = helpers.filter_byGroup
        when "filter_byDate_asc"
            @func = helpers.filter_byDate_asc
        when "filter_byDate_desc"
            @func = helpers.filter_byDate_desc
        end
    end


    def create
        self.new
        @user = User.find_by_id(session[:user_id])
        #@user.accounts.new(name: account_params[:name])
        @account = Account.new(name: account_params[:name], user_id: @user.id, visible: true)

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

    def activate 
        @account = Account.find(params[:id])
        @account.update(visible: true)
        redirect_to '/accounts/index', allow_other_host: true
    end

    def remove
        @account = Account.find(params[:id])
        @account.update(visible: false)
        redirect_to '/accounts/index', allow_other_host: true
    end

    private 

    def account_params
        params.require(:account).permit(:name, :account_type, :user_id, :visible)
    end

end
