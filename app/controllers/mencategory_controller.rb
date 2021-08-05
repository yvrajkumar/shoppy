class MencategoryController < ApplicationController
    def index
        url = request.original_url
        category = url.split('/')[4] 
        @products = Mencategory.where("lower(gender) LIKE lower(?) ", "Male").and(Mencategory.where("lower(title) LIKE lower(?) ", "%#{category}%")).or(Mencategory.where("lower(brand) LIKE lower(?) ", "%#{category}%")).or(Mencategory.where("lower(category) LIKE lower(?) ", "%#{category}%"))
        puts @products 

    end
end
  