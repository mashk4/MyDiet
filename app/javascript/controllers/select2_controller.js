import { Controller } from "@hotwired/stimulus"
import "select2/select2.full.min"

export default class extends Controller {
  connect() {
    let opts = {
      width: '100%'
    }

    $('#diet_meal_ids').select2(opts);
    $('#eaten_product_meal_ids').select2(opts);
  }
}

