class UserParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [ :name, :age, :gender, :address, :languages, :avatar ])
  end
end

class ShopParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [ :shop_name, :owner_name, :open_at, :close_at, :description, :address, :photo, :url, :phone_number, :logo ])
  end
end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #    # For additional fields in app/views/devise/registrations/new.html.erb
  #    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  #  end

  def devise_parameter_sanitizer
    if resource_class == User
      UserParameterSanitizer.new(User, :user, params)
    elsif resource_class == Shop
      ShopParameterSanitizer.new(Shop, :shop, params)
    else
      super # Use the default one
    end
  end

  def after_sign_in_path_for(resource)
    shops_path
  end

  private

  def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
