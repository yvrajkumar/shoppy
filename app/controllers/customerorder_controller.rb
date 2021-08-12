class CustomerorderController < ApplicationController
    def show
        @orderdetails = Orderdetails.where(email: current_user.email)
        @orderinfo = []
        @orderdetails.each do 
            @orderinfo = Orders.where(orderdetailsid: @orderdetails.pluck(:id))
        end 
    end

    def cancel
        url = request.original_url
        order = Customerorder.find_by(id: cancelorder_params[:order_id])
        customerorder = Customerorder.where(id: cancelorder_params[:order_id])
        orderdetailsid = customerorder.pluck(:orderdetailsid)
        
        orderdetails = Orderdetails.where(id: orderdetailsid)  
        tax = orderdetails.pluck(:tax)
        tax = tax[0] 
         
        costsum = orderdetails.pluck(:costsum)[0]-customerorder.pluck(:cost)[0]

        totalcost = costsum+(costsum*tax*0.01)

        deliverycharge = 0 
        if totalcost<1000 && totalcost>0
            totalcost=totalcost+100
            deliverycharge = 100
        else 
            deliverycharge = 0
        end

        updateorderdetails = Orderdetails.find_by(id: orderdetailsid)

        if updateorderdetails.update(costsum: costsum, totalcost: totalcost, deliverycharge: deliverycharge)      
            if order.destroy       
                redirect_to "/customerorder/show"         
            else
                redirect_to "/cart/show"
            end           
        else
            redirect_to "/cart/show"
        end

        orderdetails = Orderdetails.find_by(id: orderdetailsid)
        if Orderdetails.where(id: orderdetailsid).pluck(:totalcost)[0]==0
            orderdetails.destroy
        else 
            puts "orders exits"
        end 
        orderdetails = Orderdetails.where(id: orderdetailsid)
        
    end
    private 

    def customerorder_params
        params.permit(:title, :email, :product_id, :cost, :status, :quantity, :img_url, :address)
    end

    def cancelorder_params
        params.permit(:order_id)
    end
end
  