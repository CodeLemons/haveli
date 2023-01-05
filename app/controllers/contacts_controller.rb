class ContactsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :new]
    
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
        
        respond_to do |format|
          if @contact.valid?
            @contact.save!
            ContactMailer.contact_email(@contact).deliver_now
            format.html { redirect_to homepage_path(locale: params[:locale]) }
            
          else
            # Render the form page as a string and include it in the JSON response
            new_html = render_to_string(:template => "contacts/new")
            format.json { render json: { errors: @contact.errors, new_html: new_html }, status: :unprocessable_entity }
          end
        end
    end
    
      private
    
      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
      end
end
