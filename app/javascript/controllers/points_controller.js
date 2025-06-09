import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="points"
export default class extends Controller {
	static targets = ["circle"];

	connect() {
		console.log("point connecté");
	}

	animationAlert() {
		console.log("allert ++++ 3333 pts");

		this.circleTarget.innerHTML = "<p>+3pts</p>";
		this.circleTarget.classList.add("point-active");
		setTimeout(() => {
			this.circleTarget.classList.remove("point-active");
			this.circleTarget.innerHTML = "";
		}, 500);
	}
	animationFlight() {
		this.circleTarget.innerHTML = "<p>+10pts</p>";
		this.circleTarget.classList.add("point-active");
		setTimeout(() => {
			this.circleTarget.classList.remove("point-active");
		}, 500);
		this.circleTarget.innerHTML = "";
	}
}
