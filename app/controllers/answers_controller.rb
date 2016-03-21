class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_question, only: [:create, :edit, :update]
  before_action :set_answer, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :load_activities, only: [:index, :show, :new, :edit]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.includes(:user, :question).paginate(page: params[:page], per_page: 20).order("created_at DESC")
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @comments = @answer.comments.includes(:user).paginate(page: params[:page], per_page: 10).order("created_at DESC")
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { respond_to @question }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @answer.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @answer.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.friendly.find(params[:id])
    end

    def set_question
      @question = Question.friendly.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :body, :user_id)
    end

    def load_activities
      @activities = PublicActivity::Activity.includes(owner: :questions).order('created_at DESC').limit(10)
    end   
end
