class User < ApplicationRecord
    validates :email, presence: true
    validates :password, presence: true, length: {minimum: 5}
    validates :theme, inclusion: {in: THEMES}

    has_many :accounts

    #Just a thought, for when we move to the front-end
    THEMES = ['dark', 'light']
end
