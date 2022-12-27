import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-jump"
export default class extends Controller {

  connect() {
    console.log("Hello from menu controller");
  }

  scrollToMenu() {
    console.log("Scrolling");
    window.scrollTo(0, 978);
  }

  scrollToDelivery() {
    console.log("Scrolling");
    window.scrollTo(0, 2240);
  }
}
