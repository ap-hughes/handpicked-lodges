class ContactMailer < ApplicationMailer
  def form(contact_email)
    @message = contact_email.message
    @email = contact_email.email
    @name = contact_email.name
    mail(to: "info@handpickedlodges.com", reply_to: @email, subject: "Message received from Handpicked Lodges website contact form")
  end
end
