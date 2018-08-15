class PhotosController < ApplicationController
  before_action :find_photo, only: [:destroy]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully created photo!"
      redirect_to properties_path
    else
      flash[:alert] = "Error adding new photo!"
      render :new
    end
  end

  def destroy
    if @photo.destroy
      flash[:notice] = "Successfully deleted photo!"
      redirect_to properties_path
    else
      flash[:alert] = "Error deleting photo!"
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end
end
