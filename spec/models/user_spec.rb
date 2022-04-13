require 'rails_helper'
require 'rspec/rails'

RSpec.describe User, :type => :model do
    it "is valid with valid attributes" do 
        expect(User.new).to_not be_valid
    end
    it "is not valid without an email" do
        expect(User.new(password: "password")).to_not be_valid
    end
    it "is not valid without a password" do
        expect(User.new(email: "test@test.com")).to_not be_valid
    end
    it "requires a valid password" do 
        expect(User.new(password: "pass", email: 'test@test.com')).to_not be_valid
    end
end