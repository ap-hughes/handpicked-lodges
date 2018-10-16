class Admin::FeaturesController < Admin::AdminController
  before_action :find_feature, except: [:new, :create]

  def new
    @feature = Feature.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @feature = Feature.new(feature_params)
    if @feature.save
      redirect_to admin_properties_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @feature.update(feature_params)
      redirect_to admin_properties_path
    else
      render :edit
    end
  end

  def destroy
    if @feature.destroy
      redirect_to admin_properties_path
    else
      flash[:alert] = "Error deleting feature!"
    end
  end

  private

  def find_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :key, :property_id)
  end
end
