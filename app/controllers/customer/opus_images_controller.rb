class Customer::OpusImagesController < ApplicationController
 def show
  @customer = current_customer
  @opus = Opu.find(params[:opu_id])
 end

 def destroy
  params[:image_id].each do |image|
   @opu = OpusImage.find(image)
   @opu.destroy
  end
  redirect_to opus_path
 end

  private

end