class AccountController < ApplicationController
    def index 
        @accounts = Account.all
    end

    def show
        #Dunno if id is the best selector for this field...
        @account = Account.find(params[:id])
    end 

    def new 
        @account = Account.new
    end

    def create
        @account = Account.new(name: "...")

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

end
