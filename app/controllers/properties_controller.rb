class PropertiesController < ApplicationController
  require 'open-uri'

  def index
    @nights = [1, 2, 3]
    if params[:search].present?
      @available_properties = Property.search(params)
      @properties = Property.where(enabled: true).order("random()")
      @days = params[:search][:nights]
    elsif params[:query].present?
      @properties = Property.filter(params[:query].slice(:wood_stove, :pet_friendly, :hot_tub, :sauna, :in_aviemore, :in_country, :sauna_or_hot_tub)).where(enabled: true).order("random()")
    else
      @properties = Property.where(enabled: true).order("random()")
    end
  end

  def show
    if params[:book_link].present?
      @property = Property.where(enabled: true).find(params[:id])
      @price = params[:price]
      @book_link = params[:book_link]
      @start_date = Date.parse params[:start_date]
      @end_date = @start_date + params[:nights].to_i
      @days = params[:nights]
    else
      @property = Property.where(enabled: true).find(params[:id])
    end
  end
end
