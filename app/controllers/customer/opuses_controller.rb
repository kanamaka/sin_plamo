class Customer::OpusesController < ApplicationController
 def show
  @opus = Opu.new
 end
 
 def index
  @opus = Opu.all
 end

 def create
  @opus = Opus.new(content_image_params)
  @opus.customer_id = current_customer.id
  @opus.save
  redirect_to customer_id_path
 end

 def search
  @opus = Opus.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
 end

  private

  def opus_params
    params.require(:opus).permit(:opus_name, :image, :opus_explanation)
  end
end