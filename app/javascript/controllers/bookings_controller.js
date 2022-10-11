import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
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

  displayPassengerForms(e) {
    const passengersNumber = e.target.selectedOptions[0].value;
    this.buildPassengers(passengersNumber);
  }

  buildPassengers(passengersNumber) {
    const form = document.getElementById("passenger-fields");
    while (form.firstChild) {
      form.removeChild(form.firstChild);
    }

    for (let i = 0; i < passengersNumber; i++) {
      const div = document.createElement("div");
      const label = document.createElement("label");
      const input = document.createElement("input");
      div.classList = "passenger-info field";
      label.setAttribute("for", `booking_passengers_attributes_${i}_name`);
      label.textContent = `Passenger ${i + 1} name`;
      input.id = `booking_passengers_attributes_${i}_name`;
      input.setAttribute("name", `booking[passengers_attributes][${i}][name]`);
      input.setAttribute("type", "text");
      div.append(label, input);
      form.appendChild(div);
    }
  }
}
