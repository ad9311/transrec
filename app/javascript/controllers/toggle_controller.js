import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  sideMenu() {
    const menu = this.menuTarget

    menu.classList.toggle('side-menu-off');
  }
}
