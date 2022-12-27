class ContactMailer < ApplicationMailer
    def contact_email(contact)
        @contact = contact
        mail(from: @contact.email, to: "asamalihamza@gmail.com", subject: "New contact form submission")
      end
    
      def confirmation_email(contact)
        @contact = contact
        mail(to: @contact.email, subject: "Confirmation of contact form submission")
      end
end
