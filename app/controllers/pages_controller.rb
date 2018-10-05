class PagesController < ApplicationController
  def home
    @properties = Property.order(created_at: :asc).limit(3)
    @posts = Post.order(created_at: :desc).limit(2)
    @reviews = Review.order(created_at: :desc).limit(3)
  end
  def about_the_area
  end
  def contact
  end
  def own_a_property
  end
  def go_catered
  end
  def getting_here
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
    @reviews = Review.all
  end
  def privacy_policy
  end
end
