class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

  def configure_permitted_parameters
	if resource_class == User
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city,:phone_number])
	else
	end
  end
end
