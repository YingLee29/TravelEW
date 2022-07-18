// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require bootstrap-datepicker
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery'

require ("./jquery.raty")
require ("./ratyrate.js.erb")
//= require jquery.raty
//= require ratyrate
Rails.start()
ActiveStorage.start()

window.bootstrap = require("bootstrap");
import "../stylesheets/application.scss";

$(document).on('ready', function() {
  $('.input-daterange').datepicker({
    format: "dd-mm-yyyy"
  });
});