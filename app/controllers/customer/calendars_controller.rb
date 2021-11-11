class Customer::CalendarsController < ApplicationController
 def show
  @opus = current_customer.opu.find(params[:id])
 end

 def index
  @opera = current_customer.opu
 end

 def new
  @opera = current_customer.opu
 end

 def edit
  @opus = current_customer.opu.find(params[:id])
 end

 def update
  @opus = current_customer.opu.find(params[:id])
  @opus.update(update_params)
  redirect_to calendars_path(@customer.id)
 end

 def create
  @opus = current_customer.opu.new(opus_memo)
  if @opus.save
   redirect_to calendars_path(@customer.id)
  else
   redirect_to new_carender_path(@customer.id)
  end
 end

 def destroy
  @opera = current_customer.opu.find(params[:id])
  @opera.destroy
  redirect_to calendars_path(@customer.id)
 end

 private
  def opus_memo
   params.permit(:start_time,:title, :content,:customer_id)
  end

  def update_params
    params.require(:opus).permit(:start_time,:title, :content,:customer_id)
  end

end
