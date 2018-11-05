class ReviewsController < ApplicationController
  #before_action :authenticate_user!
  load_and_authorize_resource :review
  before_action :set_review, only: %i[show destroy]

  def index
    if current_user.role == 'admin'
      @reviews = Review.where(movie_id: params[:movie]).all.paginate(page: params[:page], per_page: 10)
    else
      @reviews = Review.where(user_id: current_user.id).paginate(page: params[:page], per_page: 10)
    end
  end

  def new
    @review = Review.new
    @review.user_id = current_user.id
    @review.movie_id = params[:id]
  end

  def show; end

  def create
    @review = Review.new(review_params)
    @r = Review.where(movie_id: params[:review][:movie_id], user_id: current_user.id)
    if @r.empty?
      respond_to do |format|
        if @review.save
          format.html { redirect_to @review, notice: 'Review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
        else
          #flash[:error] = @review.errors.full_messages.to_sentence
          format.html { redirect_back(fallback_location: new_review_path) }
        end
      end
    else
      flash[:notice] = 'Already reviewed'
      redirect_to movies_url
      end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      if current_user.role == 'admin'
        format.html { redirect_to admin_movies_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to movies_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :movie_id)
  end
end