class Customer::FavoritesController < ApplicationController
def create
 @opus = Opu.find(params[:opu_id])
 @favorite = current_customer.favorites.new(opu_id: @opus.id)
 @favorite.save
 redirect_to opus_path
end

def destroy
 @opus = Opu.find(params[:opu_id])
 @favorite = current_customer.favorites.find_by(opu_id: @opus.id)
 @favorite.destroy
 redirect_to opus_path
end
end
