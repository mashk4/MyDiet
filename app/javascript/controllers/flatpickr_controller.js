import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    var config = {
      dateFormat: "Y-m-d"
    }
    flatpickr(this.element, config);
  }
}