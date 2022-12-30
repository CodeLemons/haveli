class ShoppingCartsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :finalize, :remove, :quantity]
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
        @shopping_cart.update(total_quantity: @shopping_cart.shopping_cart_items.sum(&:quantity), total_price: @shopping_cart.shopping_cart_items.sum { |item| item.quantity * item.menu_item.price })
        @shopping_cart.save!
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

    def remove
        @menu_item = MenuItem.find(params[:menu_item_id])
        @shopping_cart = ShoppingCart.find_by(session_id: session.id.to_s)
        unless @shopping_cart.nil?
            @shopping_cart_item = @shopping_cart.shopping_cart_items.find_by(menu_item_id: @menu_item.id)
            @shopping_cart_item.quantity -= 1 if @shopping_cart_item.present? && @shopping_cart_item.quantity != 0 
            unless @shopping_cart_item.nil?
                @shopping_cart_item.save!
            end
            @shopping_cart.update(total_quantity: @shopping_cart.shopping_cart_items.sum(&:quantity), total_price: @shopping_cart.shopping_cart_items.sum { |item| item.quantity * item.menu_item.price })
            @shopping_cart.save!
    
            render partial: "shopping_carts/shopping_cart", locals: { shopping_cart: @shopping_cart}
        end
    end

    def quantity
        @shopping_cart = ShoppingCart.for_session(session.id.to_s)
        @shopping_cart_item = @shopping_cart.shopping_cart_items.find_by(menu_item_id: params[:dish_id])

        if @shopping_cart_item.nil?
            render json: { quantity: 0 }
        else
            render json: { quantity: @shopping_cart_item.quantity }
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
