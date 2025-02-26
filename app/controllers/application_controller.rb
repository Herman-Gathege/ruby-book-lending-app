class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Ensure users are signed in before accessing pages
  
  protect_from_forgery with: :exception  # Protect against CSRF attacks

  # Allow Devise to permit additional user attributes (if needed)
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
