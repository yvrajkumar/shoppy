class SearchController < ApplicationController
    def index
        category = params[:search]
        @products = Search.where("lower(gender) LIKE lower(?) ", "%#{category}%").or(Search.where("lower(title) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(brand) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(category) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(img_url) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(searchfilters) LIKE lower(?) ", "%#{category}%"))
        puts @products
    end
end
  