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
Refile.secret_key = 'e120d709795d7078ca56e4811f7d64a62f1ab1815d731f7986cfacbade7d940f30c5779e0571e332fef7b9449e6d88ec0f396686a3fb70769a13d5de9584b007'