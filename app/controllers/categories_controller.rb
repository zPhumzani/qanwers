class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :load_activities, only: [:index, :show]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.includes(:user).all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @questions = @category.questions.includes(user: :questions).paginate(page: params[:page], per_page: 10)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end

    def load_activities
      @activities = PublicActivity::Activity.includes(owner: :questions).order('created_at DESC').limit(10)
    end
end
