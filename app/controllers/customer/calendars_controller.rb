class Customer::CalendarsController < ApplicationController
 def show
  @customer = current_customer
  @calendar = Calendar.new
  @calendars = Calendar.all
 end
 def index
 end
 def new
  @calendar = Calendar.new
 end
 def edit
  @calendars = Calendar.find(params[:id])
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
  if @calendar.update(calendars_params)
   if @calendar.update(customer_params)
    redirect_to calendars_path
   else
    render :edit
   end
  end
 end

 def destroy
  @calendar.destroy
  redirect_to calendar_path
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
