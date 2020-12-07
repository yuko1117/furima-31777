class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname ,:first_name ,:last_name ,:first_name_katakana ,:last_name_katakana ,:birth_date])
    devise_parameter_sanitizer.permit(:new, keys: [:name ,:explanation ,:category_id ,:status_id ,:delivery_fee_id ,:shipping_area_id ,:days_until_shipping_id ,:selling_price])
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
 
end
