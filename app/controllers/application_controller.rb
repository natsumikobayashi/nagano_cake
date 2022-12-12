class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller?
  protected
  
  def configure_permitted_paramaters
  devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
