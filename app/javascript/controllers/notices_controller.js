import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notices"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.classList.add("notice-fade-out");
      setTimeout(() => {
        this.element.remove();
      }, 500);
    }, 40000);
  }
}
