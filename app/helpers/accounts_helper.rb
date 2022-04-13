module AccountsHelper
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

    def filter_byGroup
        @account = Account.find_by_id(params[:id])
        @transactions = @account.transactions
        groupArray = Array.new
        returnArray = Array.new
        for transaction in @transactions
            if !groupArray.include?(transaction.group) && transaction.group != ""
                groupArray.push(transaction.group)
            end
        end
        groupArray.push("")
        for group in groupArray
            for transaction in @transactions
                if transaction.group == group
                    returnArray.push(transaction)
                end
            end
        end
        puts 'ding'
        puts returnArray
        returnArray
    end

    def filter_byDate_asc
        @account = Account.find_by_id(params[:id])
        @transactions = @account.transactions
        returnArray = Array.new( [@transactions[0]] )
        for i in ( 1...@transactions.length )
            for j in (0...returnArray.length)
                if j == returnArray.length - 1 
                    if ( @transactions[i].date > returnArray[j].date )
                        returnArray.push( @transactions[i] )
                    else 
                        returnArray.insert( returnArray.length-2, @transactions[i] )
                    end
                elsif @transactions[i].date <= returnArray[j].date 
                    returnArray.insert( j, @transactions[i] )
                    break
                end
            end
        end
        puts returnArray
        return returnArray
    end

    def filter_byDate_desc
        @account = Account.find_by_id(params[:id])
        @transactions = @account.transactions
        returnArray = Array.new( [@transactions[0]])
        for i in ( 1...@transactions.length )
            for j in (0...returnArray.length)
                if j == returnArray.length - 1 
                    if ( @transactions[i].date < returnArray[j].date )
                        returnArray.push( @transactions[i] )
                    else 
                        returnArray.insert( returnArray.length-2, @transactions[i] )
                    end
                elsif @transactions[i].date >= returnArray[j].date
                    returnArray.insert( j, @transactions[i] )
                    break
                end
            end
        end
        return returnArray
    end

    def filter_Amount_asc
    end

    def filter_Amount_desc
    end

    def filter_transType
    end
end
