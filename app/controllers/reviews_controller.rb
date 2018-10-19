# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :review
  before_action :set_review, only: %i[show edit update destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    if current_user.role == 'admin'
      @movie_id = params[:movie]
      @reviews = Review.where(movie_id: @movie_id).all#.paginate(page: params[:page], per_page: 10)
    else
      @reviews = Review.all#.paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    @review = Review.new
    @review.user_id = current_user.id
    @review.movie_id = params[:id]
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @r = Review.includes(:movie, :user).where(movie_id: params[:review][:movie_id], user_id: current_user.id)
    if @r.empty?
      respond_to do |format|
        if @review.save
          format.html { redirect_to @review, notice: 'Review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
        else
          flash[:error] = @review.errors.full_messages.to_sentence
          format.html { redirect_back(fallback_location: new_review_path) }
        end
      end
      else
        flash[:notice] = "Already reviewed"
        redirect_to movies_path
      end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      if current_user.role == "admin"
        format.html { redirect_to admin_movies_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to movies_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :movie_id)
  end
end
