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
    if @feature.save
      respond_to do |format|
        format.html { redirect_to edit_admin_property_path(@feature.property) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
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
    if @feature.update(feature_params)
      redirect_to edit_admin_property_path(@feature.property)
    else
      render :edit
    end
  end

  def destroy
    @feature.destroy
    # if @feature.destroy
    #   redirect_to edit_admin_property_path(@feature.property)
    # else
    #   flash[:alert] = "Error deleting feature!"
    # end
  end

  private

  def find_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :key, :property_id)
  end
end
