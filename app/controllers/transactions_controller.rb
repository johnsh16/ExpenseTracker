class TransactionsController < ApplicationController
    def index
        @user = User.find_by_id(session[:user_id])
        @accounts = @user.accounts
        @transactions = @user.transactions
        if @accounts != nil
            puts @accounts
        else 
            puts "No accounts to show"
        end
    end

    def show_by_date
        puts params[:date]
        newDate = params[:date].slice(0..3) + "-" + params[:date].slice(4..5) + "-" + params[:date].slice(6..7)
        puts newDate
        @user = User.find_by_id(session[:user_id])
        @transactions = @user.transactions.where(date: newDate)
        render :show
    end

    def new
        #@transaction = Account.find_by_id(transaction_params[:account]).new(transaction_params)
        @transaction = Transaction.new
    end

    def create 
        #@transaction = User.find_by_id(transaction_params[:account]).new(transaction_params)
        date = Date.new(params["date_field(1i)"].to_i, params["date_field(2i)"].to_i, params["date_field(3i)"].to_i)
        #date = Date.new date_field["date_field(1i)"].to_i, date_field["date_field(2i)"].to_i, date_field["date_field(3i)"].to_i
        @account = Account.find_by(name: params[:account_name])
        @user = User.find_by_id(session[:user_id])
        @transactions = Transaction.new(amount: params[:amount], date: date, description: params[:description], trans_type: params[:trans_type], account_id: @account.id, user_id: @user.id, visible: true)

        if @transactions.save
            redirect_to "/account/#{@account.id}"
        else 
            puts @transactions.date
            render :create, status: :unprocessable_entity
        end
    end

    def edit 
        @transaction = Transaction.find_by id: params[:id]
        @account = Account.find_by_id(@transaction.account_id)
    end

    def update 
        @transaction = Transaction.find_by id: params[:id]
        @account = Account.find_by_name(transaction_params[:account_name])
        groupvar = transaction_params[:group]
        if (transaction_params[:newgroup] != "") 
            groupvar = transaction_params[:newgroup]
        end
        @transaction.update(amount: transaction_params[:amount], trans_type: transaction_params[:trans_type], description: transaction_params[:description], account_id: @account.id, group: groupvar)

        if @transaction.save
            redirect_to "/accounts/#{@account.id}"
        else 
            render :edit
        end
    end

    def remove
        @transaction = Transaction.find(params[:id])
        @transaction.update(visible: false)
        redirect_back_or_to "/transactions/index"
    end

    def all 
        @user = User.find_by_id(session[:user_id])
        @transactions = @user.transactions
    end 

    def activate
        @transaction = Transaction.find(params[:id])
        @transaction.update(visible: true)
        redirect_to '/transactions/all'
    end

    private 

    def transaction_params
        params.require(:transaction).permit(:amount, :account_name, :trans_type, :date_field, :description, :user_id, :account_id, :group, :newgroup)
    end
end
