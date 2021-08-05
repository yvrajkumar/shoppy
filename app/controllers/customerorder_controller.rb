class CustomerorderController < ApplicationController
    def new
        customerorder = Customerorder.new(customerorder_params)
        customerorder.cost = customerorder_params[:cost].to_i*customerorder_params[:quantity].to_i
        if customerorder.save
            redirect_to "/customerorder/show"
        else
            redirect_back fallback_location: "/product_details/customerorder.product_id"
        end
        
    end

    def show
        @orders = Customerorder.where(email: current_user.email)

    end 

    def cancel
        order = Customerorder.find_by(id: cancelorder_params[:order_id])
        if order.destroy       
            redirect_to "/customerorder/show"         
        else
            render json: {status: 'ERROR', message: 'Order is not removed.', data: values}
        end
    end
    private 

    def customerorder_params
        params.permit(:title, :email, :product_id, :cost, :status, :quantity, :img_url, :address)
    end

    def cancelorder_params
        params.permit(:order_id)
    end
end
  