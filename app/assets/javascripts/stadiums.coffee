# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#stadium_search').on 'submit', (e) ->
    $('.stadiums').html('<i class="fa fa-refresh fa-spin"></i> Идет загрузка...')