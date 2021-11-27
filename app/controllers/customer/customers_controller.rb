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
  @opu_ranks = Opu.find(Favorite.group(:opu_id).order('count(opu_id) desc').limit(3).pluck(:opu_id))
  @opera = Opu.all
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
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

 def follower
  @users = Customer.all
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
  customer = Customer.find(params[:customer_id])
  @customerss = customer.followings
 end

 def follow
  @users = Customer.all
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
  customer = Customer.find(params[:customer_id])
  @customerss = customer.followers
 end



private

def customer_params
  params.require(:customer).permit(:name, :profile, :profile_image)
end
end