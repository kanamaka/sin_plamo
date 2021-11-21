class Customer::FriendsController < ApplicationController
  def create
   @other_customer = Customer.find(params[:customer_id])
   current_customer.follow(@other_customer)
   redirect_to request.referer
  end

  def destroy
   @customer = current_customer.friends.find(params[:customer_id])
   current_customer.unfollow(params[:customer_id])
   redirect_to request.referer
  end
end
