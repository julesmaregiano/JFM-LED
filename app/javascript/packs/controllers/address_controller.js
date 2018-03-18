import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["search", "latitude"]

  connect() {

  }

  onPlaceChanged() {
    let { geometry } = this.getPlace();

    this.latitudeTarget.value = geometry.location.lat();

  }

  search(event) {
    var autocomplete = new google.maps.places.Autocomplete(this.searchTarget, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', this.onPlaceChanged);
  }

}
