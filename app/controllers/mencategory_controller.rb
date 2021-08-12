class MencategoryController < ApplicationController
    def index
        if (!params[:size].blank?  && !params[:color].blank?)
            gender = params[:gender]
            category = params[:category]
            size = params[:size]  
            color = params[:color]
            @products = Mencategory.where('lower(gender) like lower(?)', "%#{gender}%").and(Mencategory.where('lower(size) like lower(?)', "%#{size}%")).and(Mencategory.where('lower(category) = lower(?)', category)).and(Mencategory.where('lower(searchfilters) like lower(?)', "%#{color}%"))
            puts @products
        elsif !params[:size].blank? 
            gender = params[:gender]
            category = params[:category]
            size = params[:size]  
            @products = Mencategory.where('lower(gender) like lower(?)', "%#{gender}%").and(Mencategory.where('lower(size) like lower(?)', "%#{size}%")).and(Mencategory.where('lower(category) = lower(?)', category))
            puts @products
        elsif !params[:color].blank? 
            gender = params[:gender]
            category = params[:category]
            color = params[:color]  
            @products = Mencategory.where('lower(gender) like lower(?)', "%#{gender}%").and(Mencategory.where('lower(searchfilters) like lower(?)', "%#{color}%")).and(Mencategory.where('lower(category) = lower(?)', category))
            puts @products
        else
            url = request.original_url
            category = url.split('/')[4] 
            puts Mencategory.class
            @products = Mencategory.where("lower(gender) LIKE lower(?) ", "Male").and(Mencategory.where("lower(category) = lower(?) ", category))
            puts @products 
        end 
    end

end
  