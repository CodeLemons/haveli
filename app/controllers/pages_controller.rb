class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home]

  def home
    @menu = Menu.all
    id = params[:menu_id] || Menu.first.id
    @menu_items = MenuItem.where(menu_id: id)
    @gallery = Gallery.all
    @contact = Contact.new
    @reservation = Reservation.new
  end

  # def create
  #   @contact = Contact.new(contact_params)
  #   if @contact.valid?
  #     @contact.save
  #     ContactMailer.contact_email(@contact).deliver_now
  #     ContactMailer.confirmation_email(@contact).deliver_now
  #     redirect_to root_path, notice: "Your message has been sent."
  #   else
  #     render :new
  #   end
  # end

  # private

  # def contact_params
  #   params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
  # end
end
