class Customer::OpusImagesController < ApplicationController
 def show
  @customer = current_customer
  @opus = Opu.find(params[:opu_id])
 end

 def destroy
  @opu = Opu.find(params[:opu_id])
  @opus.destroy
  redirect_to customer_path
 end

  private

  def opus_params
    params.require(:opu).permit(:opus_name, :opus_explanation, :opus_image_id, opus_images_images: [])
  end
end