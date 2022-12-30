import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-cart"

export default class extends Controller {
  static targets = ["shoppingCart", "parent", "value"]
  connect() {
    console.log("HELLO WORLD");
  }

  addItem(event) {
    event.preventDefault()
    const dishId = event.currentTarget.getAttribute("data-dish-id");
    const itemCountElement = this.valueTargets.find(element => element.getAttribute("data-dish-id") === dishId);
    let itemCount = parseInt(itemCountElement.textContent, 10);
    itemCount += 1;
    itemCountElement.textContent = itemCount;
    console.log("ADDING ITEMS");
    let form = event.currentTarget
    let url = form.parentElement.action
    let data = new FormData(form.parentElement)

    fetch(url, {
      method: "POST",
      body: data
    })
      .then(response => response.text())
      .then(html => {
        this.shoppingCartTarget.innerHTML = html
      })
  }

  removeItem(event) {
    event.preventDefault()
    const dishId = event.currentTarget.getAttribute("data-dish-id");
    const itemCountElement = this.valueTargets.find(element => element.getAttribute("data-dish-id") === dishId);
    let itemCount = parseInt(itemCountElement.textContent, 10);
    if (itemCount > 0) {
      itemCount -= 1;
      itemCountElement.textContent = itemCount;
    }
    console.log("Removing ITEMS");
    let form = event.currentTarget
    let url = form.parentElement.action
    let data = new FormData(form.parentElement)

    fetch(url, {
      method: "PATCH",
      body: data
    })
      .then(response => response.text())
      .then(html => {
        this.shoppingCartTarget.innerHTML = html
      })
  }
}
