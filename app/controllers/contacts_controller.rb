class ContactsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :new]
    
    def new
        @contact = Contact.new
        @haveli = Restaurant.first
    end

    def create
      @contact = Contact.new(contact_params)
      @result = verify_recaptcha(model: @contact)
      raise
      if params["g-recaptcha-response"] != "" && verify_recaptcha(model: @contact) && @contact.valid?
        ContactMailer.contact_email(@contact).deliver_now
        redirect_to homepage_path(locale: params[:locale]), notice: "Your message has been sent."
      else
        Rails.logger.info "verify_recaptcha: #{verify_recaptcha(model: @contact)}"
        Rails.logger.info "@contact.valid?: #{@contact.valid?}"
        render :new
      end
    end

      private

      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
      end
end
