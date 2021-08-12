class OrderdetailsController < ApplicationController
    def new
        order = Orderdetails.new 
        order.costsum =Orders.where(:id=>params[:item_ids]).sum(:cost)
        order.email = current_user.email 
        order.tax=18
        order.totalcost=order.costsum+(order.costsum*order.tax*0.01)
        if order.totalcost<1000
            order.totalcost=order.totalcost+100
            order.deliverycharge = 100
        else 
            order.deliverycharge = 0
        end 
        if order.save
            redirect_to "/customerorder/show"
        else 
            redirect_back fallback_location: "/cart/check"
        end 
        updated_orders = Orders.where(:id=>params[:item_ids]).update_all({:status=>'ordered', :orderdetailsid=>order.id })


    end


end
  