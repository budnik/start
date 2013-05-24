#= require hamlcoffee
#= require_tree ../templates
ymaps?.ready ->
  map = new ymaps.Map 'map', {center: [50.45, 30.523], zoom: 11}
  marks = document.points.map (c)->
    param= balloonContent: JST["balloon"] c["activity"] 
    opts= balloonCloseButton: false, preset: c["activity"]["icon"]
    new ymaps.Placemark [c['latitude'], c['longitude']], param, opts 

  map.geoObjects.add m for m in marks

  map.controls.add('zoomControl', { top: 75, left: 5 })

  map.geoObjects.events.add 'mouseenter touchstart', (e)->
    geoObject = e.get('target')
    position = e.get('globalPixelPosition')
    balloon = geoObject.balloon.open(position)
    balloon.events.add 'mouseleave', -> balloon.close()

$ ->
  $(document).on 'touchstart', 'a.activity', (e)->
    e.stopPropagation()
    e.preventDefault()
    window.location.href = @href

