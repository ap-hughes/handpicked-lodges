class PagesController < ApplicationController
  before_action :instantiate_page_data

  def home
    @max_sleeps ||= Property.where(enabled: true).order("sleeps DESC").first.sleeps
    @posts = Post.order(created_at: :desc).limit(2)
    @reviews = Review.order(created_at: :desc).limit(3)
  end
  def about_the_area
  end
  def contact
    @contact_email = ContactEmail.new
  end
  def own_a_property
    @contact_email = ContactEmail.new
  end
  def go_catered
  end
  def pet_friendly
  end
  def families
  end
  def about_us
  end
  def terms_and_conditions
  end
  def frequently_asked_questions
  end
  def reviews
    @properties = Property.order(name: :asc).includes(:reviews).where.not(reviews: { id: nil })
  end
  def privacy_policy
  end
  def cookies
  end

  def sustainability
    @community = Community.first
  end

  def sustainability_policy
  end

  private

  def instantiate_page_data
    @page = Page.find_by(name: params[:action])
  end
end
