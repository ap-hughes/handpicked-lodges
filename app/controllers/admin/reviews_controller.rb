class Admin::ReviewsController < Admin::AdminController
  def new
    @property = Property.find(params[:property_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `property_id` to asssociate review with corresponding restaurant
    @review.property = Property.find(params[:property_id])
    if @review.save
      redirect_to properties_path
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to properties_path
    else
      flash[:alert] = "Error deleting review!"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
