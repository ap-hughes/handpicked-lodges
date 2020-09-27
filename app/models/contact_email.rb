class ContactEmail
  include ActiveModel::Model

  attr_accessor :name, :email, :message, :email_to
  validates :name, :email, :message, :email_to, presence: :true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
