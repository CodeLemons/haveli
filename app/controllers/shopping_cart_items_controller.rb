class ShoppingCartItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:update]
    
    def update
        @shopping_cart_item = ShoppingCartItem.find(params[:id])
        if @shopping_cart_item.update(shopping_cart_item_params)
            flash[:success] = "Item in cart was successfuly update!"
            redirect_to orders_path
        else
            flash[:error] = "Item in cart failed to update!"
        end
    end 

    private

    def shopping_cart_item_params
        params.require(:shopping_cart_item).permit(:quantity)
    end
end
