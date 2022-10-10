import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  show() {
    alert("Hey from Stimulus");
  }

  disableAirport(e) {
    const selectedOption = e.target.selectedOptions[0].value;
    const selectedAirport = e.target.id;
    if (selectedAirport == "arrival_airport_id") {
      this.disableAirportOption(selectedOption, "departure_airport_id");
    } else {
      this.disableAirportOption(selectedOption, "arrival_airport_id");
    }
  }

  disableAirportOption(selectedOption, selectedAirport) {
    document.getElementById(selectedAirport).childNodes.forEach((option) => {
      option.disabled = false;
      if (option.value == selectedOption) {
        option.disabled = true;
      }
    });
  }
}
