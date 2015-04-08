class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_action :get_relations, only:[:new, :edit]
  # GET /results
  # GET /results.json
  def index
       @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @survey = Survey.find(@result.survey_id)
  end

  # GET /results/new
  def new
    if params[:type] == :SurveyResult
      @result = Result::SurveyResult.new
      @survey = Survey.find(params[:survey_id])
      @survey.questions.each do |question|
         @result.answers.build(question_id:question.id)
      end
    else
      @result = Result.new 
    end

  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end
    
    def get_relations
      @users = User.all
      @tasks = Task.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:task_id, :user_id, 
                                     :started_date, 
                                     :ended_date, :comment, 
                                     :survey_id,
                                     :type, answers_attributes:[:content, :question_id, {:option_ids=>[]}])
    end
end
