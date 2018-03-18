import { Controller } from "stimulus"
import { loadScript } from "tiny-script-loader"

export default class extends Controller {

  static targets = ["search"]

  connect() {
  }

  search(event) {

  var bookingAddress = document.getElementById('booking_address_attributes_address1');
    var autocomplete = new google.maps.places.Autocomplete(bookingAddress, { types: ['geocode'] });
    console.log(event.target.value);
  }

}
