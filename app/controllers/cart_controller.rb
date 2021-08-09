class CartController < ApplicationController
    def new
        cartitem = Cart.new(cart_params)
        cartitem.cost = cart_params[:cost].to_i*cart_params[:quantity].to_i
        if cartitem.save
            redirect_to "/cart/show"
        else
            redirect_back fallback_location: "/product_details/cartitem.product_id"
        end
        
    end

    def show
        @cart = Cart.where(email: current_user.email).and(Cart.where(status: "cart"))
    end 

    def update
        updateorder = Cart.find_by(id: update_params[:order_id])
        status = "ordered"
        if updateorder.update(status: status)      
            redirect_to "/customerorder/show"           
        else
            redirect_to "/cart/show"
        end

    end

    def cancel
        cartitem = Cart.find_by(id: cancelitem_params[:order_id])
        if cartitem.destroy       
            redirect_to "/cart/show"         
        else
            render json: {status: 'ERROR', message: 'Not removed from cart.', data: values}
        end
    end
    private 

    def cart_params
        params.permit(:title, :email, :product_id, :cost, :status, :quantity, :img_url, :address)
    end

    def update_params
        params.permit(:order_id)
    end

    def cancelitem_params
        params.permit(:order_id)
    end
end
  