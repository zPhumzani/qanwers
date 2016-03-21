class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show,]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end
  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    if current_user
      @profile = current_user.profile
        if @profile.update(profile_params)
          redirect_to current_user, notice: 'Profile was successfully updated.' 
        else
          redirect_to current_user
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:gender, :date_of_birth, :country, :interest, :website, :professional_skills, :language, :about_you)
    end
end
