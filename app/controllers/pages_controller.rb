class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home ]

  def home
    @menu = Menu.all
    id = params[:menu_id] || Menu.first.id
    @menu_items = MenuItem.where(menu_id: id) 
  end

  # def load_dishes
  #   new_url = `http://localhost:3000/homepage?menu_id=#{params[:menu_id]}`
  #   render json: { new_url: new_url }
  # end
end
