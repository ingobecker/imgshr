$(document).on 'content:update', ->
  box = $('#endless_page')
  box.change (e) ->
    $.ajax
      type: 'put',
      url: box.data('uri'),
      data:
        gallery:
          endless_page: e.target.checked

  box = $('#ocr')
  box.change (e) ->
    $.ajax
      type: 'put',
      url: box.data('uri'),
      data:
        gallery:
          ocr: e.target.checked

  box = $('#read_only')
  box.change (e) ->
    $.ajax
      type: 'put',
      url: box.data('uri'),
      data:
        gallery:
          read_only: e.target.checked

  box = $('#ratings_enabled')
  box.change (e) ->
    $.ajax
      type: 'put',
      url: box.data('uri'),
      data:
        gallery:
          ratings_enabled: e.target.checked

  box = $('#device_links_only')
  box.change (e) ->
    $.ajax
      type: 'put',
      url: box.data('uri'),
      data:
        gallery:
          device_links_only: e.target.checked


  slider = $('.slider').first()
  if !slider.prev().hasClass('slider')
    slider.slider()

  $('#new_picture input[type="file"]').change (e) ->
    $('#new_picture button[type="submit"]').removeClass('disabled')

  $('#toggle-fifty-percent').off('click')
  $('#toggle-fifty-percent').click (e) ->
    $('#picture_grid').toggleClass('fifty-percent')

    icon = $(this).find('.glyphicon')
    icon.toggleClass('glyphicon-zoom-out')
    icon.toggleClass('glyphicon-zoom-in')

    false
