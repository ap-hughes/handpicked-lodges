class PagesController < ApplicationController
  def home
    @properties = Property.order(created_at: :asc).limit(3)
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
end
