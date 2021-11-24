class Customer::FavoritesController < ApplicationController
def create
 @opus = Opu.find(params[:opu_id])
 @favorite = current_customer.favorites.new(opu_id: @opus.id)
 @favorite.save
 @opus.create_alarm_favorite!(current_customer)
end

def destroy
 @opus = Opu.find(params[:opu_id])
 @favorite = current_customer.favorites.find_by(opu_id: @opus.id)
 @favorite.destroy
end
end
