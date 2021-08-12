class WomencategoryController < ApplicationController
    def index
        if (!params[:size].blank?  && !params[:color].blank?)
            gender = params[:gender]
            category = params[:category]
            size = params[:size]  
            color = params[:color]
            @products = Womencategory.where('lower(gender) like lower(?)', "%#{gender}%").and(Womencategory.where('lower(size) like lower(?)', "%#{size}%")).and(Womencategory.where('lower(category) = lower(?)', category)).and(Womencategory.where('lower(searchfilters) like lower(?)', "%#{color}%"))
            puts @products
        elsif !params[:size].blank? 
            gender = params[:gender]
            category = params[:category]
            size = params[:size]  
            @products = Womencategory.where('lower(gender) like lower(?)', "%#{gender}%").and(Womencategory.where('lower(size) like lower(?)', "%#{size}%")).and(Womencategory.where('lower(category) = lower(?)', category))
            puts @products
        elsif !params[:color].blank? 
            gender = params[:gender]
            category = params[:category]
            color = params[:color]  
            @products = Womencategory.where('lower(gender) like lower(?)', "%#{gender}%").and(Womencategory.where('lower(searchfilters) like lower(?)', "%#{color}%")).and(Womencategory.where('lower(category) = lower(?)', category))
            puts @products
        else
            url = request.original_url
            category = url.split('/')[4] 
            @products = Womencategory.where("lower(gender) LIKE lower(?) ", "Female").and(Mencategory.where("lower(category) = lower(?) ", category))
            puts @products
        end
    end
end 
  