import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation"
export default class extends Controller {
  static targets = ["dateTime"]
  static values = {
    taken: Array
  }
  connect() {
    console.log("Hello from reservations");
    // console.dir(this.dateTimeTarget);
    console.log(this.takenValue);
    this.takenValue.forEach((element) => {
      console.log(element.reservation_time);
    });
    console.log(this.formTarget);
  }

  onSubmit() {
    console.log("Hello");
    this.takenValue.forEach((element) => {
      if(this.dateTimeTarget.value == element.reservation_time) {
        this.dateTimeTarget.disabled = true
      }
    });
    // const takenReservations = this.data.get("reservationTakenValue")
    // console.log(takenReservations);
  }
}
