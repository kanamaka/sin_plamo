class Customer::OpusController < ApplicationController
 def show
  @opus = Opu.new
 end

 def new
  @opus = Opu.new
  @opus.opus_images.build
 end

 def index
  @opus = Opu.all
 end

 def create
  @opus = Opu.new(opus_params[:id])
  @opus.customer_id = current_customer.id
  @opus.save
  redirect_to opus_path
 end

 def search
  @opus = Opus.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
 end

  private

  def opus_params
    params.require(:opu).permit(:opus_name, :image, :opus_explanation, opus_images_images: [])
  end
end
