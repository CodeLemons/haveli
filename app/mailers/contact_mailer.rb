class ContactMailer < ApplicationMailer
    def contact_email(contact)
        @contact = contact
        mail(from: @contact.email, to: "asamalihamza@gmail.com", subject: "New contact form submission")
    end
end
