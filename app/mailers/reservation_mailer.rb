class ReservationMailer < ApplicationMailer
    def reservation_email(reservation)
        @reservation = reservation
        mail(from: @reservation.email, to: "asamalihamza@gmail.com", subject: "New reservation form submission")
    end
end
