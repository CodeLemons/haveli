class PagesController < ApplicationController
  include ActionController::Cookies
  skip_before_action :authenticate_user!, only: [ :landing, :home]

  def home
    @haveli = Restaurant.first
    I18n.locale = params[:locale].downcase
    cookies[:menu_id] = params[:menu_id] if params[:menu_id]
    @menu = Menu.all
    cookies[:menu_id] ? id = cookies[:menu_id] : id = Menu.first.id
    @menu_items = MenuItem.includes(:text_translations).includes(:shopping_cart_items).search_by_id(id)
    @gallery = Gallery.all
    @shopping_cart = ShoppingCart.new
  end
end
