class ShoppingCartsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :finalize]
    before_action :clear_shopping_cart, only: [:home], if: -> { request.get? }

    def create
        @menu_item = MenuItem.find(params[:menu_item_id])
        @shopping_cart = ShoppingCart.find_or_create_by(session_id: session.id.to_s)
        @shopping_cart.save!
        @shopping_cart_item = @shopping_cart.shopping_cart_items.find_or_initialize_by(menu_item_id: @menu_item.id)
        if @shopping_cart_item.new_record?
            @shopping_cart_item.quantity = 1
        else
            @shopping_cart_item.quantity += 1
            # @shopping_cart_item = @shopping_cart.shopping_cart_items.create(menu_item_id: @menu_item.id, quantity: 1)
        end
        @shopping_cart_item.save!
        render partial: "shopping_carts/shopping_cart", locals: { shopping_cart: @shopping_cart}       
    end

    def finalize
        @shopping_cart = ShoppingCart.find_by(session_id: session.id.to_s)
        if @shopping_cart
            @shopping_cart_items = @shopping_cart.shopping_cart_items
            if @shopping_cart_items.present?
                @order = Order.create(restaurant: Restaurant.first)
                @shopping_cart_items.each do |item|
                    OrderItem.create(order_id: @order.id, menu_item_id: item.menu_item_id, quantity: item.quantity)
                end
                @shopping_cart.destroy
                redirect_to orders_path(@order), notice: "Order placed successfully!"
            else
                redirect_to homepage_path, alert: "No items in the shopping cart!"
            end
        else
            redirect_to homepage_path, alert: "No shopping cart found!"
        end
    end

    private
    
    def clear_shopping_cart
        @shopping_cart = ShoppingCart.find_by(session_id: session.id.to_s)
        if @shopping_cart
            @shopping_cart.destroy
        end
    end
end
