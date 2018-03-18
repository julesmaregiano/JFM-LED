import { Controller } from "stimulus"
import { loadScript } from "tiny-script-loader"

export default class extends Controller {

  static targets = ["search"]

  connect() {

  }

  onPlaceChanged() {
    console.log(this.getPlace());
  }

  search(event) {
    var autocomplete = new google.maps.places.Autocomplete(this.searchTarget, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', this.onPlaceChanged);
  }

}
