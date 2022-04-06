class Account < ApplicationRecord
    #validates :type, inclusion: { in: ACCOUNT_TYPES}

    belongs_to :user
    has_many :transactions

    #ACCOUNT_TYPES = ['savings', 'checking', 'other']

    
end
