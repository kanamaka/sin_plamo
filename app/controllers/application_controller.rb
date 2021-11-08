class ApplicationController < ActionController::Base
 def after_sign_in_path_for(resource)
  customer_path(current_customer.id)
 end
 def after_sign_out_path_for(resource)
    root_path
 end
 
 private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
