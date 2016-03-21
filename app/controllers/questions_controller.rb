class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :load_activities, only: [:index, :show, :new, :edit]

  # GET /questions
  # GET /questions.json
  def index
    if params[:tag]
      @questions = Question.includes(:user, :answers).tagged_with(params[:tag]).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    else
      @questions = Question.includes(:user, :answers).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answers = @question.answers.includes(:user, :comments).paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  # GET /questions/new
  def new
    @question = current_user.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @question.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @question.downvote_by current_user
    redirect_to :back
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:category_id, :body, :slug, :all_tags)
    end

    def load_activities
      @activities = PublicActivity::Activity.includes(owner: :questions).order('created_at DESC').limit(10)
    end
end
