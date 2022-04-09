module TransactionHelper
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
end
