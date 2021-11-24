class Customer::AlarmsController < ApplicationController
 def index
   @alarms = current_customer.passive_alarms.page(params[:page]).per(20)
   @alarms.where(checked: false).each do |alarm|
   alarm.update_attributes(checked: true)
   end
 end
end
