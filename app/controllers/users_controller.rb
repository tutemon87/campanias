class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  resource_description do
    short "Administración de usuarios"
  end
  def_param_group :user do
    param :user, Hash do
      param :name, String, :desc => "Name of user", :required => true
      param :email, String, :desc => "Email for login", :required => true
      param :password, String, :desc => "Password for login", :required => true
      param :avatar,String , :desc => "path of image avatar"
    end
  end


  # GET /users
  # GET /users.json
  api :GET, "/users.json", "Recuperación de usuarios"
  formats ['json']
  description "Recupera del catalogo de usuarios todos los usuarios en el sistema."
  example JSON.pretty_generate([User.new,User.new].as_json).to_s
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json

  api :GET, "/users/:id.json", "Usuario especifico"
  formats ['json']
  description "Muestra los datos de un usuario en especifico"
  example JSON.pretty_generate(User.new.as_json).to_s
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end




  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  api :POST, "/users", "Crear un usuario especifico"
  formats ['json']
  description "Crea un nuevo usuario"
  param_group :user
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :avatar, :email, :password)
    end
end
