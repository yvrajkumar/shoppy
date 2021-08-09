class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:title, :age, :brand, :category, :cloth_type, :color, :gender, :id, :img_url, :price, :size, :searchfilters)
    end

end
