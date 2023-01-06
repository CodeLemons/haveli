class ContactsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :new]
    
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.valid?
          ContactMailer.contact_email(@contact).deliver_now
          redirect_to homepage_path(locale: params[:locale]), notice: "Your message has been sent."
        else
          render :new
        end
      end

      private

      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
      end
end
