class Customer::FriendsController < ApplicationController
  def create
    @other_customer = Customer.find(params[:follower])
    current_customer.follow(@other_customer)
  end

  def destroy
    @customer = current_customer.friends.find(params[:id]).follower
    current_customer.unfollow(params[:id])
  end
end
