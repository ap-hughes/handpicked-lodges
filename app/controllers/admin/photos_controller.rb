class Admin::PhotosController < Admin::AdminController
  before_action :find_photo, except: [:new, :create]

  def new
    @property = Property.find(params[:property_id])
    @photo = Photo.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.property = Property.find(params[:property_id])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to edit_admin_property_path(@photo.property), notice: 'Photo was successfully uploaded.' }
        format.js
      else
        format.html { flash[:alert] = "There was an error uploading the photo. Please try again." }
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
      if @photo.update(photo_params)
        format.html { redirect_to edit_admin_property_path(@photo.property) }
        format.js
      else
        format.html { flash[:alert] = "There was an error updating the photo. Please try again." }
        format.js
      end
    end
  end

  def destroy
    unless @photo.destroy
      flash[:alert] = "Error deleting photo!"
    end
  end

  private

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :key, :property_id, :picture)
  end
end
