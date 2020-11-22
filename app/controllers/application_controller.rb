class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname ,:first_name ,:last_name ,:first_name_katakana ,:last_name_katakana ,:birth_date])
    devise_parameter_sanitizer.permit(:new, keys: [:name ,:explanation ,:category_id ,:status_id ,:delivery_fee_id ,:shipping_area_id ,:days_until_shipping_id ,:selling_price])
  end
end
