class PagesController < ApplicationController
  include ActionController::Cookies
  skip_before_action :authenticate_user!, only: [ :landing, :home]

  def home
    # I18n.locale = :ro
    cookies[:menu_id] = params[:menu_id] if params[:menu_id]
    @menu = Menu.all
    # id = params[:menu_id] || Menu.first.id
    cookies[:menu_id] ? id = cookies[:menu_id] : id = Menu.first.id
    @menu_items = MenuItem.where(menu_id: id)
    @gallery = Gallery.all
    @contact = Contact.new
    @reservation = Reservation.new
    @shopping_cart = ShoppingCart.new
  end
end
