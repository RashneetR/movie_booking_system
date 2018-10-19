# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
   def edit
    puts " \n\n\n hello \n\n i#{params[:id]}\n\n\n"
    if params[:id].nil?
      puts " \n\n\n hi raashi \n\n i#{params[:user]}\n\n\n"
      @user = current_user
    else
      @user = User.find_by(id: params[:id])
       puts " \n\n\n hello \n\n #{@user.name}\n\n\n"
    end
  end

  # POST /users
  # POST /users.json
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
    #byebug
    @user.active = 0
    #@user.name = self.name
    #@user.email = self.email
    #@user.role = self.role
    #@user.id = self.id
    respond_to do |format|
      #if @user.update
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      #else
        #format.html { redirect_to users_url, notice: 'Error deleting user' }
        #format.json { head :no_content }
      #end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = if params[:id] == 'sign_out'
              User.find(current_user.id)
            else
              User.find(params[:id])
          end
  end

  def role?
    role == current_user.role
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    if current_user.role == "admin"
      params.require(:user).permit(:name, :email, :role)
    else
      params.fetch(:user, {})
    end
end
end
