class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :name, :description, :emergency_contact_name, :emergency_contact_number, :address])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :emergency_contact_name, :emergency_contact_number, :address])
  end

  # run in Terminal: heroku config:set DOMAIN=www.my_product.com

# For meta tags in heroku production
  def default_url_options
  { host: ENV["flock525.club"] || "localhost:3000" }
  end
end

