import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static values = { id: Number, user: Number };

	connect() {
		console.log("vote connect");
	}

	async upvote() {
		console.log(this.idValue);

		const response = await fetch(
			`/alerts/${this.idValue}/upvote?user=${this.userValue}`,
			{
				method: "PATCH",
				headers: { Accept: "application/json" },
			}
		);

		if (response.ok) {
			const data = await response.json();
			console.log(data);
		}
	}

	async downvote() {
		const response = await fetch(
			`/alerts/${this.idValue}/downvote?user=${this.userValue}`,
			{
				method: "PATCH",
				headers: { Accept: "application/json" },
			}
		);

		if (response.ok) {
			const data = await response.json();
			console.log(this.element);
			if (data.deleted) {
				const wrapper = this.element.closest(".flight-show-alert-wrapper");
				if (wrapper) wrapper.remove();
			}
		}
	}
}
