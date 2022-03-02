// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require i18n
//= require i18n.js
//= require i18n/translations

require("jquery")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "@fortawesome/fontawesome-free/css/all"
import I18n from "i18n-js"

window.I18n = I18n

Rails.start()
Turbolinks.start()
ActiveStorage.start()


window.jQuery = $;
window.$ = $;
