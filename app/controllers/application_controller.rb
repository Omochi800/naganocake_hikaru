class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      public_root_path
    else
      customer_registration_path
    end
  end

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_root_path
    else
      public_root_path
    end
  end

  def after_sign_out_path_for(resource)
      public_root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end



end
