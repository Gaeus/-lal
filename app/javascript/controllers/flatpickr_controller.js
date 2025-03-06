// app/javascript/controllers/flatpickr_controller.js
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickrRangePlugin"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["dateStart", "dateEnd"]

  connect() {

    flatpickr(this.dateStartTarget, {
      mode: "range",  // Enables range selection
      dateFormat: "Y-m-d", // Format YYYY-MM-DD
      minDate: "today", // Prevents past date selection
      plugins: [new rangePlugin({ input: this.dateEndTarget })] // Links the second input
    })
  }
}
