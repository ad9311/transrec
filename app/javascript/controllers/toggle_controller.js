import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "month", "year"]

  sidebarOptions() {
    this.sidebarTarget.classList.toggle('sidebar-off')
  }

  monthDropdown() {
    this.monthTarget.classList.toggle('hide')
  }

  yearDropdown() {
    this.yearTarget.classList.toggle('hide')
  }
}
