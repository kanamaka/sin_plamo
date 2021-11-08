class Customer::CalendarsController < ApplicationController
 def show
 end

 def index
  @calendar = Calendar.new
  @customer = current_customer
 end

 def create
  @calendar = calendar.new(calendars_params)
 end
end
