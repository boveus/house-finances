import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
    static targets = ["name", "district", "output"]

    name() {
        fetch(`/find_representatives?name=${this.nameTarget.value}`)
            .then(response => response.text())
            .then(html => this.outputTarget.innerHTML = html)
    }
    district() {
        fetch(`/find_representatives?district=${this.districtTarget.value}`)
            .then(response => response.text())
            .then(html => this.outputTarget.innerHTML = html)
    }
}