class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home ]

  def home
    @menu = Menu.all
    id = params[:menu_id] || Menu.first.id
    @menu_items = MenuItem.where(menu_id: id)
    @gallery = Gallery.all
  end
end
