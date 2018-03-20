import { Controller } from "stimulus"

export default class PlanningController extends Controller {
  static targets = ['menu', 'dropdown', 'form']

  connect() {
    console.log("Planning connected")
  }

  select() {
    let checked_count = document.querySelectorAll('input[type="checkbox"]:checked').length

    if(checked_count > 0) {
      this.menuTarget.classList.remove('hide');
      this.dropdownTarget.classList.add('open');
    } else {
      this.menuTarget.classList.add('hide');
    }
  }
}
