import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dish-listing"
export default class extends Controller {
  static targets = ["dishListing"]

  connect() {
    console.log("Hello from dish listing");
    
  }

  loadDishes(event) {
    event.preventDefault();
    const id = event.target.getAttribute('href').split('=')[1];

    fetch(`/homepage?menu_id=${id}`)
      .then(response => response.text())
      .then(data => {
        const htmlObject = document.createElement('dummyHTML');
        htmlObject.innerHTML = data;
        const selectedDiv = htmlObject.querySelector('.dish-listing');
        this.dishListingTarget.innerHTML = selectedDiv.innerHTML;
        console.log(window.scrollY);
        window.scrollTo(0, 978);
      })
  }
}
