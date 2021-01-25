// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import 'bootstrap'
import 'core-js/stable'
import 'regenerator-runtime/runtime'

// import SCSS 
import 'bootstrap/scss/bootstrap.scss'
import 'admin-lte/dist/css/adminlte.css'
import 'datatables.net-bs4/css/dataTables.bootstrap4.min.css'
import 'datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css'
import 'bootstrap-daterangepicker/daterangepicker.css'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
var jQuery = require('jquery')
require("jquery-ui-dist/jquery-ui")
require("jquery-ui")
// import '../../../node_modules/datatables/media/css/jquery.dataTables.css'
// import * as Popper from 'popper.js'
// global.popper = Popper

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

require("bootstrap")
require("admin-lte")
require("datatables")
require("datatables.net-bs4")
require("bootstrap/dist/js/bootstrap.bundle")
// require("admin-lte/dist/js/adminlte")
require("datatables/media/js/jquery.dataTables")
require("datatables.net-bs4/js/dataTables.bootstrap4.min")
require("datatables.net-responsive/js/dataTables.responsive.min")
// require("datatables.net/js/jquery.dataTables.min")
require("datatables.net-responsive-bs4/js/responsive.bootstrap4.min")
require("datatables.net-rowgroup/js/dataTables.rowGroup.min")
require("bootstrap-daterangepicker")

import '../donates/index'
import '../donate_things/index'

// $(document).on('click', '.sidebar-toggle', function () {
//   if ($('body').hasClass("sidebar-collapse") && $('body').hasClass("sidebar-open")) {
//       $('body').addClass("sidebar-closed");
//   }
// });

$('body,html').click(function(e){
  if ($('body').hasClass("sidebar-open")) {
    $('body').addClass("sidebar-closed");
    $('body').removeClass("sidebar-collapse");
    $('body').removeClass("sidebar-open");
  }
});

// import './alert'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
