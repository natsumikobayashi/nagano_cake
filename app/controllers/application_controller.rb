class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller?

  protected

  def configure_permitted_paramaters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :telephone_number, :is_deleted, :password])
  end
end