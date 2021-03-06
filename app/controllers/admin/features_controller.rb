class Admin::FeaturesController < Admin::AdminController
  before_action :find_feature, except: [:new, :create]

  def new
    @property = Property.find(params[:property_id])
    @feature = Feature.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.property = Property.find(params[:property_id])
    respond_to do |format|
      if @feature.save
        format.html { redirect_to edit_admin_property_path(@feature.property), notice: 'Feature was successfully created.' }
        format.js
      else
        format.html { flash[:alert] = "There was an error creating the feature. Please try again." }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to edit_admin_property_path(@feature.property) }
        format.js
      else
        format.html { flash[:alert] = "There was an error updating the feature. Please try again." }
        format.js
      end
    end
  end

  def destroy
    unless @feature.destroy
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
