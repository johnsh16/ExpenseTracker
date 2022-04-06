require 'bcrypt'
class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :password, presence: true, length: {minimum: 5}
    

    has_many :accounts
    has_many :transactions



    #Just a thought, for when we move to the front-end
    THEMES = ['dark', 'light']

end
