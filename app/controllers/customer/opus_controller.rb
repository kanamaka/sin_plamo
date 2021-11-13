class Customer::OpusController < ApplicationController
 def show
  @opus = Opu.new
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
  @opera = Opu.all
 end

 def new
  @opus = Opu.new
 end

 def index
  @opera = Opu.all
  @opus = Opu.find_by(params[:id])
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
 end

 def create
  @opus = Opu.new(opus_params)
  @opus.customer_id = current_customer.id
  @opus.save
  params[:opu][:image].shift
  params[:opu][:image].each do |image|
   opu_image = OpusImage.new()
   opu_image.image = image
   opu_image.opu_id = @opus.id
   if opu_image.valid?
    opu_image.save
   end
  end

  redirect_to opus_path
 end
 def edit
  @opu = Opu.find_by(params[:id])
  @opu_new = Opu.new
   if @opu.customer.id == current_customer
    render "edit"
   else
    redirect_to opus_path
   end
 end

  def destroy
   @opus = Opus.find(params[:id])
   @opus.destroy
   redirect_to opus_path
  end

 def search
  @opus = Opus.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
 end

  private

  def opus_params
    params.require(:opu).permit(:opus_name, :image, :opus_explanation)
  end
end
