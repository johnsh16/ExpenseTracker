class HomeController < ApplicationController
    def home
        @logged_in = helpers.logged_in?
    end
end
