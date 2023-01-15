import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-jump"
export default class extends Controller {
  static targets = ["menuSection", "deliverySection", "gallerySection"];

  connect() {
    console.log("Hello from menu controller LOL");
    console.log(window.scrollY);
  }

  scrollToMenu() {
    console.log("Scrolling");
    this.menuSectionTarget.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  scrollToDelivery() {
    console.log("Scrolling");
    this.deliverySectionTarget.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  scrollToGallery() {
    console.log("Scrolling");
    this.gallerySectionTarget.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }
  
}
