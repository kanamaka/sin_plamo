class Customer::OpusController < ApplicationController
 def show
  @opus = Opu.new
  @customer = current_customer
  @opera = Opu.find(params[:id])
 end

 def new
  @opus = Opu.new
 end

 def index
  @opera = Opu.all
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
 end

 def create
  @opus = Opu.new(opus_params)
  @opus.customer_id = current_customer.id
  @opus.save
  if params[:opu][:image].present?
   params[:opu][:image].shift
   params[:opu][:image].each do |image|
    opu_image = OpusImage.new()
    opu_image.image = image
    opu_image.opu_id = @opus.id
    if opu_image.valid?
     opu_image.save
    end
   end
  end

  redirect_to customer_path(current_customer)
 end

 def edit
  @opu = Opu.find(params[:id])
 end

 def update
  @opu = Opu.find(params[:id])
  if @opu.update(opus_params)
    if params[:opu][:image].present?
      params[:opu][:image].shift
      params[:opu][:image].each do |image|
        opu_image = OpusImage.new()
        opu_image.image = image
        opu_image.opu_id = @opu.id
        if opu_image.valid?
          opu_image.save
        end
      end
    end
   redirect_to opus_path
  else
   render :edit
  end
 end

 def destroy
  @opus = Opu.find_by(params[:id])
  @opus.destroy
  redirect_to opus_path
 end

 def search
  @opus = Opu.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
 end

  private

  def opus_params
    params.require(:opu).permit(:opus_name, :image, :opus_explanation)
  end
end
