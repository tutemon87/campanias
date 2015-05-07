class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_type, only: [:index]
  before_action :get_relations, only: [:new, :edit]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = tasks_by_type.all
  end

  # GET /users/{id}/tasks
  # GET /users/{id}/tasks.json
  def my_tasks
    user_id = params[:id]
    @tasks = Task.where('tasks.user_id = ? AND
                         max > (select count(*) from results where results.task_id = tasks.id) AND
                         tasks.expired_on >= ?',user_id, Date.today)
    render 'index'
  end


  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
    
    def get_relations
      @users = User.all
      @surveys= Survey.all if params['type'] == 'SurveyTask'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, 
                                   :started_on, :expired_on, :targeted_to, 
                                   :type, :user_id, :survey_id,:max, :min ,:action,
                                   :latitude, :longitude)
    end
    
    def set_type

       @type = get_type 
    end
    
    def get_type
        Task.types.include?(params[:type]) ? params[:type] : 'Task'
    end

    def tasks_by_type
      get_type.constantize
    end
    
end
