class SearchController < ApplicationController
    def index
        if (!params[:size].blank?  && !params[:color].blank?)
            gender = params[:gender]
            category = params[:search]
            size = params[:size]  
            color = params[:color]
            @products = Search.where('lower(gender) = lower(?)', gender).and(Search.where('lower(size) like lower(?)', "%#{size}%")).and(Search.where('lower(searchfilters) like lower(?)', "%#{color}%")).and(Search.where("lower(searchfilters) LIKE lower(?) ", "%#{category}%"))
            puts @products
        elsif !params[:size].blank? 
            gender = params[:gender]
            category = params[:search]
            size = params[:size]  
            @products = Search.where('lower(gender) = lower(?)', gender).and(Search.where('lower(size) like lower(?)', "%#{size}%")).and(Search.where("lower(searchfilters) LIKE lower(?) ", "%#{category}%"))
            puts @products
        elsif !params[:color].blank? 
            gender = params[:gender]
            category = params[:search]
            color = params[:color]  
            @products = Search.where('lower(gender) = lower(?)', gender).and(Search.where('lower(searchfilters) like lower(?)', "%#{color}%")).and(Search.where("lower(searchfilters) LIKE lower(?) ", "%#{category}%"))
            puts @products
        else
            category = params[:search]
            @products = Search.where("lower(gender) like lower(?) ", "%#{category}%").or(Search.where("lower(title) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(brand) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(category) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(img_url) LIKE lower(?) ", "%#{category}%")).or(Search.where("lower(searchfilters) LIKE lower(?) ", "%#{category}%"))
            puts @products
        end 
    end
end
  