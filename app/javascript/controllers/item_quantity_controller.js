import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="item-quantity"
export default class extends Controller {
  connect() {
  }

  update(event) {
    event.preventDefault();
    const form = event.currentTarget.parentElement
    const url = form.action
    const data = new FormData(form)
    fetch(url, {
      method: form.firstChild.value.toUpperCase(),
      body: data
    })
      .then(response => response.text())
      .then(html => {
        console.log(html);
      })
  }
}
