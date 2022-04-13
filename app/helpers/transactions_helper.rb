module TransactionsHelper
    def accounts 
        @user = User.find_by_id(session[:user_id])
        account_array = Array.new(@user.accounts.length)
        for account in @user.accounts
            account_array.push(account)
        end
        account_array
    end

    def account_names
        @user = User.find_by_id(session[:user_id])
        account_names_array = Array.new(@user.accounts.length)
        for account in @user.accounts
            account_names_array.push(account.name)
        end
        account_names_array
    end

    def amountVisible
        @user = User.find_by_id(session[:user_id])
        toReturn = 0
        for transaction in @user.transactions
            if transaction.visible == true
                return 1
            end
        end
        return 0
    end

    def returnGroups
        @user = User.find_by_id(session[:user_id])
        @transactions = @user.transactions
        groups = Array.new([""])
        for transaction in @transactions
            if (!groups.include?(transaction.group) && transaction.group != nil && transaction.group != "")
                groups.push(transaction.group)
            end
        end
        if (groups.length == 1) 
            return 0
        end
        groups
    end
end
