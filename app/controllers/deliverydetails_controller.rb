class DeliverydetailsController < ApplicationController
    def update
        door_no = deliverydetails_params[:door_no]
        street = deliverydetails_params[:street]
        area = deliverydetails_params[:area]
        city = deliverydetails_params[:city]
        state = deliverydetails_params[:state]
        country = deliverydetails_params[:country]
        phone_no = deliverydetails_params[:phone_no]
        address = door_no+", "+street+", "+area+", "+city+", "+state+", "+country+", Phone No: "+phone_no 
        puts address
        user = Deliverydetails.find_by(email: current_user.email)
        if user.update(door_no: door_no, street: street, area: area, city: city, state: state, country: country,phone_no: phone_no,address: address)                 
            redirect_to "/deliverydetails/update"
        else
            redirect_to "/deliverydetails/update"
        end
    end

    def show
        @deliverydetails = Deliverydetails.where(email: current_user.email)

    end

    private 

    def deliverydetails_params
        params.permit(:door_no, :street, :area, :city, :state, :country, :phone_no, :address)
    end
end 