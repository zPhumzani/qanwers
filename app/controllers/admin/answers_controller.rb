class Admin::AnswersController < Admin::ApplicationController
  before_action :set_admin_answer, only: [:show, :edit, :update, :destroy]

  # GET /admin/answers
  # GET /admin/answers.json
  def index
    @admin_answers = Answer.includes(:user, :question).all
  end

  # GET /admin/answers/1
  # GET /admin/answers/1.json
  def show
  end

  # GET /admin/answers/new
  def new
    @admin_answer = Answer.new
  end

  # GET /admin/answers/1/edit
  def edit
  end

  # POST /admin/answers
  # POST /admin/answers.json
  def create
    @admin_answer = Answer.new(admin_answer_params)

    respond_to do |format|
      if @admin_answer.save
        format.html { redirect_to @admin_answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @admin_answer }
      else
        format.html { render :new }
        format.json { render json: @admin_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/answers/1
  # PATCH/PUT /admin/answers/1.json
  def update
    respond_to do |format|
      if @admin_answer.update(admin_answer_params)
        format.html { redirect_to @admin_answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_answer }
      else
        format.html { render :edit }
        format.json { render json: @admin_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/answers/1
  # DELETE /admin/answers/1.json
  def destroy
    @admin_answer.destroy
    respond_to do |format|
      format.html { redirect_to admin_answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_answer
      @admin_answer = Answer.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_answer_params
      params.require(:answer).permit(:question_id, :body, :user_id)
    end
end
