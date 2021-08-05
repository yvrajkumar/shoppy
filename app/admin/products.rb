ActiveAdmin.register Products do
    permit_params :title, :age, :brand, :category, :cloth_type, :color, :gender, :product_id, :img_url, :price, :size
end 
