import { Application } from "@hotwired/stimulus"
import jQuery from "jquery";


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
window.$ = window.jQuery = jQuery;

export { application }
