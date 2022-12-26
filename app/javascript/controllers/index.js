// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DishListingController from "./dish_listing_controller"
application.register("dish-listing", DishListingController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MenuJumpController from "./menu_jump_controller"
application.register("menu-jump", MenuJumpController)
