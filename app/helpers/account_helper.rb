module AccountHelper
    def balance 
        @transactions = Account.find_by_id(params[:id]).transactions
        balance = 0
        for transaction in @transactions 
            if transaction.visible
                if transaction.trans_type == "debit"
                    balance -= transaction.amount
                elsif transaction.trans_type == "credit"
                    balance += transaction.amount
                end
            end
        end
        balance
    end 

    def balanceFromInput (id)
        @transactions = Account.find_by_id(id).transactions
        balance = 0
        for transaction in @transactions 
            if transaction.trans_type == "debit"
                balance -= transaction.amount
            elsif transaction.trans_type == "credit"
                balance += transaction.amount
            end
        end
        balance
    end

    def formatTransType (transaction) 
        return_symbol = ""
        if transaction.trans_type == "debit"
            return_symbol = "-"
        elsif transaction.trans_type == "credit"
            return_symbol = "+"
        end
        return_symbol
    end

    def hiddenAccounts? 
        @user = User.find_by_id(session[:user_id])
        @accounts = @user.accounts
        for account in @accounts
            if account.visible == false
                return true
            end
        end
        return false
    end
end
