class Admin::PropertiesController < Admin::AdminController
  before_action :find_property, except: [:new, :create, :index]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @property.photos.build
    @property.reviews.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:notice] = "Successfully created property!"
      redirect_to admin_properties_path
    else
      render :new
    end
  end

  def edit
    @property.photos.build
    @property.reviews.build
    @photos = @property.photos
    @reviews = @property.reviews
  end

  def update
    if @property.update(property_params)
      redirect_to admin_properties_path
    else
      render :edit
    end
  end

  def destroy
    if @property.destroy
      redirect_to admin_properties_path
      flash[:notice] = "Successfully deleted property!"
    else
      flash[:alert] = "Error deleting property!"
    end
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:code, :in_aviemore, :in_country, :enabled, :name, :sleeps, :headline, :description, :min_daily_price, :bedrooms, :bathrooms,
      :wood_stove, :hot_tub, :pet_friendly, :sauna, :features, :we_love, :guests_love, :latitude, :longitude, :hero_image, photos_attributes: [:id, :image], reviews_attributes: [:id, :content])
  end
end
