class TransactionsController < ApplicationController
    def index
        @accounts = User.find_by_id(session[:user_id]).accounts
        
    end

    def show 
        @transactions = User.find_by_id(session[:user_id])
    end

    def new
        #@transaction = Account.find_by_id(transaction_params[:account]).new(transaction_params)
        #@transaction = Transaction.new
    end

    def create 
        #@transaction = Account.find_by_id(transaction_params[:account]).new(transaction_params)
        @transactions = Transaction.new(transaction_params)

        if @transactions.save
            render :index
        else 
            puts @transactions.date
            render :create, status: :unprocessable_entity
        end
    end

    def destroy
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
    end

    private 

    def transaction_params
        params.require(:transaction).permit(:amount, :account, :trans_type, :date, :description)
    end
end
