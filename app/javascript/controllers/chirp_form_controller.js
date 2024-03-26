import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chirp-form"
export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:submit-end', () => {
      document.getElementById('close-modal-btn').click(); // this is hacky and I hate it but it closes the modal
      this.element.reset(); // this clears the form on turbo stream
    });
  }
}
