class Account < ApplicationRecord
    validates :name, presence: true

    belongs_to :user
    has_many :transactions

    #ACCOUNT_TYPES = ['savings', 'checking', 'other']

    
end
