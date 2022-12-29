class OrdersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def index
        @order = Order.find(params[:format])
        @order_items = OrderItem.where(order: Order.last.id)
    end
end
