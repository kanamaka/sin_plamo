class Customer::OpusController < ApplicationController
 def show
  @opus = Opu.new
  @opus = Opus.find(params[:id])
  @opus_tags = @opus_tags
 end

 def new
  @opus = Opu.new
 end

 def index
  @opus = Opu.all
  @tag_list = Tag.all
  @opu = current_customer.opu.new
 end

 def create
  @opus = current_customer.opu.new(opus_params[:id])
  tag_list = params[:opu][:tag].split(nil)
  @opus.customer_id = current_customer.id
  if @opus.save
   @opus.save.tag(tag_list)
   redirect_to opus_path
  else
   render :new_opu_pats
  end
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
