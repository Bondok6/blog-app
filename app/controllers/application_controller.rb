class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_out_path_for(resource_or_scope)
    if current_user
      request.referrer
    else
      root_path
    end
  end 
end
