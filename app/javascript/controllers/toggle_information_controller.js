import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-information"
export default class extends Controller {
	static targets = ["details", "personal"];
	connect() {
		console.log("toggel connécté");
	}

	disable() {
		this.detailsTarget.classList.toggle("flight-show-detail-toggle");
	}
	disablePersonal() {
		this.personalTarget.classList.toggle("flight-show-detail-toggle");
	}
}
