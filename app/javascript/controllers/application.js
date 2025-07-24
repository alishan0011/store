import { Application } from "@hotwired/stimulus"
import 'intl-tel-input';
import 'intl-tel-input/build/css/intlTelInput.css';

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
