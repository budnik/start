#= require hamlcoffee
#= require_tree ../templates
ymaps.ready ->
  unless @haveMap?
    map = new ymaps.Map 'map', {center: [50.45, 30.523], zoom: 11}
    @haveMap = true
    # iconContent: '<i class="icon-plus-sign"></i>'}
    marks = (new ymaps.Placemark [c['latitude'], c['longitude']], balloonContent: JST["test"]({a:c["activity"]}) for c in document.points)
    marks.map (m)->
      map.geoObjects.add m
    map.controls.add('zoomControl', { top: 75, left: 5 })

    map.geoObjects.events.add 'mouseenter', (e)->
      geoObject = e.get('target')
      position = e.get('globalPixelPosition')
      balloon = geoObject.balloon.open(position)
      balloon.events.add 'mouseleave', -> balloon.close()
