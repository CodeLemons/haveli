class ReservationsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :new]
    invisible_captcha only: [:create], honeypot: :subtitle
    
    def new
        @reservation = Reservation.new
        @haveli = Restaurant.first
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.valid?
            ReservationMailer.reservation_email(@reservation).deliver_now
          redirect_to homepage_path(locale: params[:locale]), notice: "Your reservation has been sent."
        else
          render :new
        end
      end

      private

      def reservation_params
        params.require(:reservation).permit(:first_name, :last_name, :email, :phone, :party_size, :date_time, :remarks)
      end

end
