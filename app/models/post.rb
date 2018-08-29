class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  #title maximum 120 characters
  validates :title, presence: true, length: {maximum: 120}
  validates :body, presence: true
  validates :photo, presence: true

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
