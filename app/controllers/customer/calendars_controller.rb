class Customer::CalendarsController < ApplicationController
 def show
  @customer = current_customer
  @calendar = Calendar.new
  @calendars = current_customer.calendars
 end
 def index
 end
 def new
  @calendar = Calendar.new
 end
 def edit
  @calendar = Calendar.find(params[:id])
 end

 def create
  @calendar = Calendar.new(calendars_params)
  if @calendar.customer_id = current_customer.id
   @calendar.save
   redirect_to calendar_path(current_customer.id)
  else
   render :index
  end
 end

 def update
  @calendar = Calendar.find(params[:id])
  if @calendar.update(calendars_params)
    redirect_to calendar_path(params[:id])
  else
   render :edit
  end
 end

 def destroy
  @calendar = Calendar.find(params[:id])
  @calendar.destroy
  redirect_back(fallback_location: root_path)
 end

 def ensure_correct_customer
 @calendar = Calendar.find(params[:id])
   unless @calendar.customer == current_customer
     redirect_to customer_calendars_path
   end
 end

private
  def calendars_params
   params.require(:calendar).permit(:start_time,:title, :content, :parts )
  end

end
