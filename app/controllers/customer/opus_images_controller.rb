class Customer::OpusImagesController < ApplicationController
 def show
  @customer = current_customer
  @opus = Opu.find_by(params[:id])
 end

 def destroy
  @opu = Opu.find_by(params[:id])
  @opus.destroy
  redirect_to opus_path
 end

  private

  def opus_params
    params.require(:opu).permit(:opus_name, :opus_explanation, :opus_image_id, opus_images_images: [])
  end
end