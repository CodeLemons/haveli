class OrdersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :send_email]

    def index
        Rails.cache.clear
        @order = Order.find(params[:format])
        @order_items = OrderItem.where(order: Order.last.id)
    end
    
    def send_email
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order: Order.last.id)
        
        # html = render_to_string(template: "order_mailer/order_email", layout: false)
        
        OrderMailer.order_email(@order, params[:first_name], params[:last_name], params[:email], params[:phone], params[:address], params[:remarks]).deliver_now
        @shopping_cart = ShoppingCart.find_by(session_id: session.id.to_s)
        @shopping_cart.destroy
        reset_session
        redirect_to homepage_path(locale: params[:locale]), notice: 'Order placed successfully'
    end
end
