import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["hideouts", "reservations", "rents"]

  connect() {console.log("Dashboard should work")
  }

  showHideouts() {
    this.hideoutsTarget.style.display = 'block';
    this.reservationsTarget.style.display = 'none';
    this.rentsTarget.style.display = 'none';
    console.log("displaying hideouts")
  }

  showReservations() {
    this.hideoutsTarget.style.display = 'none';
    this.reservationsTarget.style.display = 'block';
    this.rentsTarget.style.display = 'none';
    console.log("displaying reservations")
  }

  showRents() {
    this.hideoutsTarget.style.display = 'none';
    this.reservationsTarget.style.display = 'none';
    this.rentsTarget.style.display = 'block';
    console.log("displaying rents")
  }
}
