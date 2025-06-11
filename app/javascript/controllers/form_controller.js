import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form"
export default class extends Controller {
  reset() {
    this.element.reset();
  }

  static targets = ["form"];

  connect() {
    console.log("ouiuou");
  }

  submit() {
    this.element.requestSubmit();
  }
}
