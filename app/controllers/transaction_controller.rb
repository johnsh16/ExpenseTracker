class TransactionController < ApplicationController
    def index
        @transactions = Transaction.all
    end

    def show 
        @transaction = Transaction.find(params[:id])
    end

    def new
        @transaction = Transaction.new
    end

    def create 
        @transaction = Transaction.new(amount: "...")

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
end
