class OrderItemsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:update, :edit]
    def update
        @order_item = OrderItem.find(params[:id])
        if @order_item.update(order_item_params)
            @order_item.save!
            redirect_to orders_path, notice: "Order item was successfully updated."
        else
            render :edit
        end
    end
        
    private
        
    def order_item_params
        params.require(:order_item).permit(:quantity)
    end
end
