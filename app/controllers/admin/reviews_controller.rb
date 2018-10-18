class Admin::ReviewsController < Admin::AdminController
  before_action :find_review, except: [:new, :create, :index]

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to admin_reviews_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to admin_reviews_path
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to admin_reviews_path
    else
      flash[:alert] = "Error deleting review!"
    end
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :date, :property_id)
  end
end
