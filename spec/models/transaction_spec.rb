require 'rails_helper'
require 'rspec/rails'

RSpec.describe Transaction, :type => :model do
    it 'is valid with valid attributes' do 
        expect(Transaction.new(date: "03/04/2022", account_id: 1, user_id: 1, amount: 10)).to be_valid
    end
    it 'requires an amount to be valid' do 
        expect(Transaction.new(date: "03/04/2022", account_id: 1, user_id: 1)).to_not be_valid
    end
    it 'requires a date to be valid' do 
        expect(Transaction.new(account_id: 1, amount: 10, user_id: 1)).to_not be_valid
    end
    it 'requires an account_id to be valid' do 
        expect(Transaction.new(amount: 10, date:"03/04/2022", user_id: 1)).to_not be_valid
    end
    it 'requires a user_id to be valid' do 
        expect(Transaction.new(account_id: 1, amount: 10, date: "03/04/2022")).to_not be_valid
    end
end