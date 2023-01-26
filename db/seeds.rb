# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Restaurant.destroy_all
Menu.destroy_all
MenuItem.destroy_all
Order.destroy_all
ShoppingCart.destroy_all
ShoppingCartItem.destroy_all
puts "Destroying everything!"

puts "Creating Haveli restaurant"
@haveli = Restaurant.new(name: "Haveli", address: "Strada Episcopul Radu 3, București 020751, Romania", phone: "+40 21 211 0390", website: "https://www.haveli.ro", video: "broll.mp4", logo: "logo.png")
puts "Adding BROLL to Restaurant"
@haveli.save!
 
puts "#{@haveli.name} CREATED"


puts "Creating Haveli's Menu"
@starters = Menu.create(restaurant: @haveli, name: "Starters")
@salad_and_yogurt = Menu.create(restaurant: @haveli, name: "Salad and Yogurt")
@vegetarian = Menu.create(restaurant: @haveli, name: "Vegetarian")
@chicken = Menu.create(restaurant: @haveli, name: "Chicken")
@lamb = Menu.create(restaurant: @haveli, name: "Lamb")
@fish_and_prawns = Menu.create(restaurant: @haveli, name: "Fish and Prawns")
@rice = Menu.create(restaurant: @haveli, name: "Rice")
@indian_bread = Menu.create(restaurant: @haveli, name: "Indian Bread")
@desserts = Menu.create(restaurant: @haveli, name: "Desserts")





puts "Adding menu items to Haveli's menu"
require 'json'

filepath = "db/seed.json"
menu = JSON.parse(File.read(filepath))

menu.each do |m|

    puts "Adding items to starters"
    m["starters"].each do |item|

        starter_menu_items = MenuItem.new(
            menu: @starters,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { starter_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { starter_menu_items.description = item["description"] }

        # starters_file = File.open("app/assets/images/#{item["photo"]}")
        # starter_menu_items.photo.attach(io: starters_file, filename: item["photo"], content_type: "image/gif")

        starter_menu_items.save!
        puts "#{starter_menu_items.name} created"

    end 

    puts "Adding items to salad_yogurt"
    m["salad_yogurt"].each do |item|

        salad_yogurt_menu_items = MenuItem.new(
            menu: @salad_and_yogurt,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { salad_yogurt_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { salad_yogurt_menu_items.description = item["description"] }

        # salad_file = File.open("app/assets/images/#{item["photo"]}")
        # salad_yogurt_menu_items.photo.attach(io: salad_file, filename: item["photo"], content_type: "image/gif")

        salad_yogurt_menu_items.save!
        puts "#{salad_yogurt_menu_items.name} created"

    end

    puts "Adding items to vegetarian"
    m["vegetarian"].each do |item|

        vegetarian_menu_items = MenuItem.new(
            menu: @vegetarian,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { vegetarian_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { vegetarian_menu_items.description = item["description"] }

        # veg_file = File.open("app/assets/images/#{item["photo"]}")
        # vegetarian_menu_items.photo.attach(io: veg_file, filename: item["photo"], content_type: "image/gif")

        vegetarian_menu_items.save!
        puts "#{vegetarian_menu_items.name} created"

    end

    puts "Adding items to chicken"
    m["chicken"].each do |item|

        chicken_menu_items = MenuItem.new(
            menu: @chicken,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { chicken_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { chicken_menu_items.description = item["description"] }

        # chick_file = File.open("app/assets/images/#{item["photo"]}")
        # chicken_menu_items.photo.attach(io: chick_file, filename: item["photo"], content_type: "image/gif")

        chicken_menu_items.save!
        puts "#{chicken_menu_items.name} created"

    end

    puts "Adding items to lamb"
    m["lamb"].each do |item|

        lamb_menu_items = MenuItem.new(
            menu: @lamb,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { lamb_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { lamb_menu_items.description = item["description"] }

        # lamb_file = File.open("app/assets/images/#{item["photo"]}")
        # lamb_menu_items.photo.attach(io: lamb_file, filename: item["photo"], content_type: "image/gif")

        lamb_menu_items.save!
        puts "#{lamb_menu_items.name} created"

    end

    puts "Adding items to fish_prawns"
    m["fish_prawns"].each do |item|

        fish_prawns_menu_items = MenuItem.new(
            menu: @fish_and_prawns,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { fish_prawns_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { fish_prawns_menu_items.description = item["description"] }

        # fish_file = File.open("app/assets/images/#{item["photo"]}")
        # fish_prawns_menu_items.photo.attach(io: fish_file, filename: item["photo"], content_type: "image/gif")

        fish_prawns_menu_items.save!
        puts "#{fish_prawns_menu_items.name} created"

    end

    puts "Adding items to rice"
    m["rice"].each do |item|

        rice_menu_items = MenuItem.new(
            menu: @rice,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { rice_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { rice_menu_items.description = item["description"] }

        # rice_file = File.open("app/assets/images/#{item["photo"]}")
        # rice_menu_items.photo.attach(io: rice_file, filename: item["photo"], content_type: "image/gif")

        rice_menu_items.save!
        puts "#{rice_menu_items.name} created"

    end

    puts "Adding items to indian_bread"
    m["indian_bread"].each do |item|

        indian_bread_menu_items = MenuItem.new(
            menu: @indian_bread,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { indian_bread_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { indian_bread_menu_items.description = item["description"] }

        # bread_file = File.open("app/assets/images/#{item["photo"]}")
        # indian_bread_menu_items.photo.attach(io: bread_file, filename: item["photo"], content_type: "image/gif")

        indian_bread_menu_items.save!
        puts "#{indian_bread_menu_items.name} created"

    end

    puts "Adding items to desserts"
    m["desserts"].each do |item|

        desserts_menu_items = MenuItem.new(
            menu: @desserts,
            name: item["name"],
            price: item["price"],
            pieces: item["pieces"],
            weight: item["weight"],
            description: item["description"],
            image: item["photo"]
        )

        I18n.with_locale(:ro) { desserts_menu_items.description = item["description_ro"] }
        I18n.with_locale(:en) { desserts_menu_items.description = item["description"] }

        # dessert_file = File.open("app/assets/images/#{item["photo"]}")
        # desserts_menu_items.photo.attach(io: dessert_file, filename: item["photo"], content_type: "image/gif")

        desserts_menu_items.save!
        puts "#{desserts_menu_items.name} created"

    end
end

c = 0
puts "Creating gallery"
42.times do
    c += 1 
    @haveli_gallery = Gallery.new(restaurant: @haveli, name: "image_#{c}", photo: "image_#{c}.png" )
    @haveli_gallery.save!
    puts "Gallery created, and image_#{c}.png attached."
end
puts "DONE"