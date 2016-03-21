class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_category
  hide_action :current_user

  def set_category
  	@side_categories = Category.all
  end

  rescue_from ActiveRecord::RecordNotFound do 
  	flash[:alert] = "Resource not found!"
  	redirect_to root_path
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  	devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name]
  end
end
