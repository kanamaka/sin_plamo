class Customer::CalendarsController < ApplicationController
 def show
 end
 
 def index
  @calendars = Calendar.all
 end
end
