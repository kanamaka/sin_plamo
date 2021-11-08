class Customer::CustomersController < ApplicationController
 def show
  @customer = current_customer
  @customers = Customer.find(params[:id])
 end

 def index
 end

 def new
  @customer = Customer.new
 end

 def create
 end

 def update
  @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     redirect_to customers_path(@customer.id)
    else
     render :edit
    end
 end

 def edit
  @customer = current_customer
 end
end
