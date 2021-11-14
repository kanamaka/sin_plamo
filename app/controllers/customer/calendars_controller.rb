class Customer::CalendarsController < ApplicationController
 def index
  @customer = current_customer
  @calendar = Calendar.new
  @calendars = Calendar.all
  #@calendars = Calendar.where(customer_id: current_customer).order(start_time: "desc").page(params[:page]).per(4)
 end
 def new
  @calendar = Calendar.new
 end
 def edit
  @calendars = current_customer.calendar.find(params[:id])
 end

 def create
  @calendar = Calendar.new(calendars_params)
  if @calendar.customer_id = current_customer.id
   @calendar.save
   redirect_to customer_calendars_path
  else
   render :index
  end
 end

 def update
  if @calendar.update(calendars_params)
   redirect_to customer_calendars_path
  else
   render :edit
  end
 end

 def destroy
  @calendars.destroy
  redirect_to calendars_path
 end

 def ensure_correct_customer
 @calendar = Calendar.find(params[:id])
   unless @calendar.customer == current_customer
     redirect_to customer_calendars_path
   end
 end

private
  def calendars_params
   params.require(:calendar).permit(:start_time,:title, :content )
  end

end
