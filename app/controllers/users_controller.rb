# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:activate_account, :activate_account_mail, :activate_user_account]
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
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find_by(id: params[:id])
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
  respond_to do |format|
          if (@user.destroy if check_admin_count)
            sign_out @user
            format.html { redirect_to static_pages_home_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
          else
            flash[:error] = "Error deleting user"
            format.html { redirect_back(fallback_location: admin_movies_url)}
            format.json { head :no_content }
          end
        end
  # DELETE /users/1.json
  def destroy
    if @user.role == "admin"
      @users = User.where(role: "admin")
      respond_to do |format|
        if @users.count >=2
          if @user.destroy
            sign_out @user
            format.html { redirect_to static_pages_home_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
          end
        else
          flash[:error] = "Cannot delete account since you are the only admin!"
              format.html { redirect_back(fallback_location: admin_movies_url)}
              format.json { head :no_content }
        end
      end
    else
      @user.active = "inactive"
      respond_to do |format|
        if @user.update
          sign_out @user
          format.html { redirect_to static_pages_home_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
        else
          flash[:error] = "Error deleting user"
          format.html { redirect_back(fallback_location: movies_url)}
          format.json { head :no_content }
        end
      end
    end
  end

  def activate_account
    #byebug
    render 'activate_account'
  end

  def activate_account_mail
    UserMailer.activate_user_account(params[:user][:email]).deliver_now
    flash[:notice] = "Email sent. Please check your mail"
    redirect_to static_pages_home_url
  end

  def activate_user_account
    @email = params[:email] + ".com"
    @user = User.where(email: @email).first
    @user.active = "active"
    flash[:notice] = "Account activated. You  can now login." if @user.save
    redirect_to new_user_session_path
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