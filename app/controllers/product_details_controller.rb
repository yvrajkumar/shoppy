class ProductDetailsController < ApplicationController
    def index
        @products = ProductDetails.where(id: params[:id])
        puts @products
    end
end
  