import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-value"
export default class extends Controller {
  static targets = ["quantity", "parent"]

  connect() {
    if (this.parentTarget.dataset.changeValueQuanValue == 0) {
      this.counter = 0;
    } else {
      this.counter = this.parentTarget.dataset.changeValueQuanValue;
    }
    this.quantityTarget.innerHTML = this.counter
  }

  addQuantity() {
    this.quantityTarget.innerHTML += 1;
  }
  
  removeQuantity() {
    this.quantityTarget.innerHTML -= 1;
  }
  


}
