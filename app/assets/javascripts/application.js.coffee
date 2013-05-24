#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_tree .
$ ->
  $('.alert-success').delay(3000).animate {top: '-100px'}, 1000, 'swing', ->
    $(@).remove()
  $('#apply-btn.disabled').click (e)->
    e.preventDefault()