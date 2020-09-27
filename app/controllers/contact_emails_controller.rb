class ContactEmailsController < ApplicationController
  def new
    @contact_email = ContactEmail.new
  end

  def create
    @contact_email = ContactEmail.new(email_params)
    if @contact_email.valid?
      ContactMailer.form(@contact_email).deliver
      redirect_to pages_contact_path
      flash[:notice] = "We have received your message and will be in touch soon!"
    else
      flash[:alert] = "There was an error sending your message. Please try again."
      render pages_contact_path
    end
  end

  private

  def email_params
    params.require(:contact_email).permit(:email, :name, :message, :email_to)
  end
end
