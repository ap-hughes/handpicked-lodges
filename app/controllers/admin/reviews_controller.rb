class Admin::ReviewsController < Admin::AdminController
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

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to admin_reviews_path
    else
      flash[:alert] = "Error deleting review!"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :date, :property_id)
  end
end
