import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation-form"
export default class extends Controller {
  static targets = ["form", "formDiv"]
  connect() {
  }

  submit(event) {
    event.preventDefault();
    const formData = new FormData(this.formTarget)
    const url = this.formTarget.action
    console.log(this.formTarget.method);

    fetch(url, {
      method: this.formTarget.method,
      body: formData
    })
      .then(response => response.json())
      .then(data => {
        if (data.new_html) {

          // console.log(data.new_html);
          const htmlObject = document.createElement('dummyHTML');
          htmlObject.innerHTML = data.new_html;
          const selectedDiv = htmlObject.querySelector('.simple_form');
          this.formDivTarget.innerHTML = selectedDiv.outerHTML;
        }
      });
  }
}
