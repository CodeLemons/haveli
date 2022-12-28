class ReservationMailer < ApplicationMailer
    def contact_email(reservation)
        @reservation = reservation
        mail(from: @reservation.email, to: "asamalihamza@gmail.com", subject: "New Reservation form submission")
      end
    
      def confirmation_email(reservation)
        @reservation = reservation
        mail(to: @reservation.email, subject: "Confirmation of reservation form submission")
      end
end
