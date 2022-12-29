import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-jump"
export default class extends Controller {

  connect() {
    console.log("Hello from menu controller");
    console.log(window.scrollY);
  }

  scrollToMenu() {
    console.log("Scrolling");
    window.scrollTo(0, 978);
  }

  scrollToDelivery() {
    console.log("Scrolling");
    window.scrollTo(0, 2280);
  }

  scrollToGallery() {
    console.log("Scrolling");
    window.scrollTo(0, 3075);
  }
  
  scrollToContact() {
    console.log("Scrolling");
    window.scrollTo(0, 4287);
  }
  
  scrollToBook() {
    console.log("Scrolling");
    window.scrollTo(0, 3075);
  }
}
