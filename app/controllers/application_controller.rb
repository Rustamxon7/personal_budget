class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:registration, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
