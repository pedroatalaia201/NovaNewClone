class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end
  
  def create 
    @contact = Contact.new(contact_params)
  end

  def send_mail
    contact = contact_params
    contact["request"] = request.base_url
    contact["site_name"] = @site_name
    contact_params = contact

    if ContactMailer.send_mailer(contact_params).deliver_now
      redirect_to contact_path, flash: {
        notice: "Seus dados foram enviados com sucesso."
      }
    else
      flash[:error] = "O envio falhou. Tente novamente"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :name, :email, :phone, :subject, :message
    )
  end
end
