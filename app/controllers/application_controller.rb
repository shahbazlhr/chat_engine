class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

  def configure_permitted_parameters
	if resource_class == User
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city,:phone_number])
	end
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
  	if resource_class == SuperAdmin
  		super_admin_dashboard_path
  	else
    	root_path
	end
  end
end
