import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-cart"
export default class extends Controller {
  static targets = ["shoppingCart"]
  connect() {
    console.log("HELLO WORLD");
  }

  addItem(event) {
    event.preventDefault()
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
}
