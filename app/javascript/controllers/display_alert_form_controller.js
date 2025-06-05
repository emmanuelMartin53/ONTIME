import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = [
		"togglableElement",
		"togglableElementPlus",
		"togglableElementMoins",
	];
	connect() {
		console.log("hello");
	}

	switch() {
		this.togglableElementTarget.classList.toggle("show-form-hidden");
		this.togglableElementPlusTarget.classList.toggle("show-form-hidden");
		this.togglableElementMoinsTarget.classList.toggle("show-form-hidden");
	}

	switchVote(event) {
		const card = event.currentTarget;
		const voteBox = card.nextElementSibling;

		if (voteBox && voteBox.classList.contains("flight-show-alert-card-vote")) {
			voteBox.classList.toggle("show-form-hidden");
		}
	}
}
