import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-jump"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
    console.log("Hello from menu controller");
  }

  scrollTo() {
    console.log("Scrolling");
    window.scrollTo(0, 978);
  }
}
