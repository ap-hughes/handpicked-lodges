class ContactMailer < ApplicationMailer
  def form(contact_email)
    @message = contact_email.message
    @email = contact_email.email
    @name = contact_email.name
    mg_client = Mailgun::Client.new ENV['MAILGUN_API']
    message_params = {from: @email,
                      to: "aphughes@talk21.com",
                      subject: "Message received from Pine Bank Chalets website contact form",
                      text: @message}
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end
