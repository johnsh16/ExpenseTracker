module HomeHelper

    def getAccountBalance (account)
        @transactions = account.transactions
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

    def accountObj
        @user = User.find_by_id(params[:id])
        puts params[:id]
        @accounts = @user.accounts
        accounts = {
            'accounts' => []
        }
        for account in @accounts
            if account.visible
                accounts['accounts'].push(
                    {
                        "name" => account.name,
                        "balance" => getAccountBalance(account)
                    }
                )
            end
        end
        puts JSON[accounts]
        return JSON[accounts]
    end 

end
