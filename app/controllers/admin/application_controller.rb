class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@admin_users = User.all
  end

  private
    def authenticate_admin!
      authenticate_user!

      unless current_user.admin?
      	flash[:alert] = "What da fuck? Maaaan you are not allowed to do this"
      	redirect_to root_path
      end
    end
end
