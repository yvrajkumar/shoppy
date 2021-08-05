ActiveAdmin.register Orders do
    permit_params :order_id, :product_id, :email, :quantity, :status, :cost
end 
