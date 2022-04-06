class TransactionController < ApplicationController
    def index
        @accounts = User.find_by_id(session[:user_id]).accounts
        
    end

    def show 
        @transactions = User.find_by_id(session[:user_id])
    end

    def new
        @transaction = Account.find_by_id(transaction_params[:account]).new(transaction_params)
    end

    def create 
        @transaction = Account.find_by_id(transaction_params[:account]).new(transaction_params)

        if @transaction.save
            redirect_to @transaction
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
    end

    private 

    def transaction_params
        params.require(:transaction).permit(:amount, :account, :type)
    end
end
