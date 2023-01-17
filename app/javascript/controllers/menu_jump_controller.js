import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-jump"
export default class extends Controller {
  static targets = ["menuSection", "deliverySection", "gallerySection", "dishImage", "description", "descriptionToggle"];

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

  toggleDescription(event) {
    // console.log(event.target.parentElement.parentElement.getAttribute('data-dish-id'));

    this.descriptionToggleTargets.forEach((element) => {
      if(element.getAttribute('data-dish-id') === event.target.parentElement.parentElement.getAttribute('data-dish-id')) {
        if(element.children[1].classList.contains('hidden')) {
          element.children[1].classList.remove('hidden');
          element.children[0].classList.add('hidden');
        } else {
          element.children[0].classList.remove('hidden');
          element.children[1].classList.add('hidden');
        }
      }
    });


    // this.descriptionToggleTargets.forEach((element) => {
    //   const correctItem = this.descriptionToggleTargets.find((target) => target.getAttribute('data-dish-id') === element.getAttribute('data-dish-id'));
    //   console.log(correctItem);
    // });
    // if(this.dishImageTarget.classList.contains('hidden')) {
    //   this.dishImageTarget.classList.remove('hidden');
    //   this.descriptionTarget.classList.add('hidden');
    // } else {
    //   this.dishImageTarget.classList.add('hidden');
    //   this.descriptionTarget.classList.remove('hidden');
    // }
  }

}
