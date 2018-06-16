// import {Collection} from 'formex'
import {Collection} from '../../../../formex/web/static/js/formex'
import $ from 'jquery'

function widgets() {
  $('.select').selectpicker().ajaxSelectPicker()
}

Collection.run(function() {
  widgets()
})

$(document).ready(function(){
  widgets()
})
