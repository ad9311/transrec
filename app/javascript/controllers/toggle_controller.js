import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  toggleSidebar() {
    const sidebar = this.sidebarTarget

    sidebar.classList.toggle('sidebar-off')
  }
}
