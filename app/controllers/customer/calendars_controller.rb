class Customer::CalendarsController < ApplicationController
 def show
  @opus = current_customer.opu.find(params[:id])
  @content = Opus.new
 end

 def index
  @customer = current_customer
  @opus = current_customer.opus.find_by(params[:id])
  @opu_new = Opu.new
  @opera = Opu.where(customer_id: current_customer).order(start_time: "desc").page(params[:page]).per(4)
 end

 def new
  @opera = current_customer.opus
 end

 def edit
  @opus = current_customer.opu.find(params[:id])
 end

 def create
  @opus = Opu.new(opu_params)
  if  opus.customer_id = current_customer.id
   opus.save
   redirect_to customer_calendar_path
  else
   render :index
  end
 end

 def update
  if @opus.update(update_params)
   redirect_to _customer_calendars_path[:id]
  else
   render :edit
  end
 end

 def destroy
  @opus.destroy
  redirect_to calendars_path
 end

 private
  def opu_params
   params.require(:opu).permit(:start_time,:title, :content)
  end

  def update_params
    params.require(:opu).permit(:start_time,:title, :parts)
  end

end
