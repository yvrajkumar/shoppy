class HomeController < ApplicationController
    def index
        @products = Home.all 
    end
end
  