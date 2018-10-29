class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[activate_account activate_account_mail activate_user_account]

  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  def edit
    @user = if params[:id].nil?
              current_user
            else
              User.find_by(id: params[:id])
            end
  end

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

  def destroy
    if @user.role == 'admin'
      @users = User.where(role: 'admin')
      respond_to do |format|
        if @users.count >= 2
          if @user.destroy
            sign_out @user
            format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
          end
        else
          flash[:error] = 'Cannot delete account since you are the only admin!'
          format.html { redirect_back(fallback_location: admin_movies_url) }
          format.json { head :no_content }
        end
      end
    else
      @user.active = 'inactive'
      respond_to do |format|
        if @user.update
          sign_out @user
          format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
        else
          flash[:error] = 'Error deleting user'
          format.html { redirect_back(fallback_location: movies_url) }
          format.json { head :no_content }
        end
      end
    end
  end

  def activate_account
    render 'activate_account'
  end

  def activate_account_mail
    UserMailer.activate_user_account(params[:user][:email]).deliver_now
    flash[:notice] = 'Email sent. Please check your mail'
    redirect_to root_url
  end

  def activate_user_account
    @user = User.where(email: params[:email]).first
    @user.active = 'active'
    flash[:notice] = 'Account activated. You  can now login.' if @user.save
    redirect_to new_user_session_url
  end

  private

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

  def user_params
    if current_user.role == 'admin'
      params.require(:user).permit(:name, :email, :role)
    else
      params.fetch(:user, {})
    end
  end
end