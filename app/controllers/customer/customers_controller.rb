class Customer::CustomersController < ApplicationController
 def show
  @users = Customer.all
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
  @opus = Opu.new
  @opera = Opu.all
  @opu = Opu.find_by(params[:id])
 end

 def index
 end

 def new
  @customer = Customer.new
 end

 def create

 end

 def edit
  @customer = Customer.find(current_customer.id)
 end

 def update
  @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
     redirect_to customer_path
    else
     render :edit
    end
 end


private

def customer_params
  params.require(:customer).permit(:name, :profile, :profile_image_id)
end
end