import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dish-listing"
export default class extends Controller {
  static targets = ["dishListing", "quantity", "value"]

  connect() {
    console.log("Hello from dish listing");
  }

  loadDishes(event) {
    event.preventDefault();

    fetch(event.currentTarget.href)
      .then(response => response.text())
      .then(data => {
        const htmlObject = document.createElement('dummyHTML');
        htmlObject.innerHTML = data;
        const selectedDiv = htmlObject.querySelector('.dish-listing');
        this.dishListingTarget.innerHTML = selectedDiv.innerHTML;

        const divs = Array.from(this.dishListingTarget.querySelectorAll('[data-shopping-cart-target="value"]'));
        console.log(this.dishListingTarget.querySelectorAll('[data-shopping-cart-target="value"]'));
        divs.forEach((target) => {
          const itemCountElement = divs.find(element => element.getAttribute("data-dish-id") === target.getAttribute("data-dish-id"));
          if (itemCountElement.getAttribute("data-dish-quantity")) {
            itemCountElement.textContent = itemCountElement.getAttribute("data-dish-quantity");
          } else {
            itemCountElement.textContent = "0";
          }
        })
      });

    fetch('/shopping_cart_items')
      .then(response => response.json())
      .then(dataItem => {
        // Update data-dish-quantity attributes
        this.valueTargets.forEach((target) => {
          const itemCountElement = this.valueTargets.find(element => element.getAttribute("data-dish-id") === target.getAttribute("data-dish-id"));
          const shoppingCartItem = dataItem.find(item => item.menu_item_id == itemCountElement.getAttribute("data-dish-id"));
          if (shoppingCartItem) {
            itemCountElement.setAttribute("data-dish-quantity", shoppingCartItem.quantity);
            itemCountElement.textContent = shoppingCartItem.quantity;
          } else {
            itemCountElement.setAttribute("data-dish-quantity", "0");
            itemCountElement.textContent = "0";
          }
        });
      });
  }
}
