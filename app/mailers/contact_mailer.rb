class ContactMailer < ApplicationMailer
  def form(contact_email)
    @message = contact_email.message
    @email = contact_email.email
    @name = contact_email.name
    @email_to = contact_email.email_to
    mail(to: @email_to, reply_to: @email, subject: "Message received from Seasgair website contact form")
  end
end
