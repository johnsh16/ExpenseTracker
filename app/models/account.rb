class Account < ApplicationRecord
    validates :type, inclusion: { in: ACCOUNT_TYPES}

    belongs_to :user

    ACCOUNT_TYPES = ['savings', 'checking', 'other']

    
end
