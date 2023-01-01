class OrderMailer < ApplicationMailer
    def order_email(order, first_name, last_name, email, phone, address, remarks)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @phone = phone
        @address = address
        @remarks = remarks
        @order = order
        @order_items = OrderItem.where(order: @order)
        mail(to: "asamalihamza@gmail.com", subject: "Order details")
    end
end
