class ReservationsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :new]

    def new
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.restaurant = Restaurant.first
        if @reservation.valid?
            @reservation.save!
            ReservationMailer.contact_email(@reservation).deliver_now
            redirect_to homepage_path, notice: "Your booking details have been sent."
        else
            render :new, status: :unprocessable_entity
        end
      end
    
      private
    
      def reservation_params
        params.require(:reservation).permit(:first_name, :last_name, :phone, :reservation_time, :party_size, :special_requests, :email)
      end

end
