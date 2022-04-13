require 'rails_helper'
require 'rspec/rails'

RSpec.describe Account, :type => :model do
    it 'is valid with valid attributes' do
        expect(Account.new(name: 'test account', user_id: 4)).to_not be_valid
    end
    it 'requires a name to be valid' do
        expect(Account.new(user_id: 4)).to_not be_valid
    end
    it 'requires a user_id to be valid' do 
        expect(Account.new(name: "test account")).to_not be_valid
    end
end