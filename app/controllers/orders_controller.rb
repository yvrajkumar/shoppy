class OrdersController < InheritedResources::Base

  private
    def order_params
      params.require(:order).permit(:order_id, :product_id, :email, :quantity, :status, :cost)
    end

end
