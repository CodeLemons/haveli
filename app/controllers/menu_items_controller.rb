class MenuItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:update]
    def update
        Mobility.locale = :ro
        @menu_item = MenuItem.find(params[:id])
        if @menu_item.update(description: params[:menu_item]["description"])
            render notice: "Menu item was successfully updated."
        else
            render notice: "Menu item was not updated check logs"
        end
    end
end
