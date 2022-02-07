class ContactMailer < ApplicationMailer
  default from: ENV["SMTP_FROM_MAIL"]

  def send_mailer(contact)
    @contact = contact

    mail(
      to: ENV["SMTP_FROM_MAIL"],
      from: ENV["SMTP_USER_NAME"],
      subject: "#{@contact['site_name']} - Formulário de contato"
    )  
  end
end
