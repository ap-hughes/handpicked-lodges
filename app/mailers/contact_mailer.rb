class ContactMailer < ApplicationMailer
  def form(contact_email)
    @message = contact_email.message
    @email = contact_email.email
    @name = contact_email.name
    mail(to: "hello@seasgairlodges.com", reply_to: @email, subject: "Message received from Seasgair website contact form")
  end
end
