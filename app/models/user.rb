require 'bcrypt'
class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :password, presence: true, length: {minimum: 5}
    

    has_many :accounts

    def email
        self.email 
    end



    #Just a thought, for when we move to the front-end
    THEMES = ['dark', 'light']

end
