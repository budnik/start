ymaps.ready ->
  unless @haveMap?
    map = new ymaps.Map 'map', {center: [50.45, 30.523], zoom: 11}
    @haveMap = true
    map.geoObjects.add new ymaps.Placemark [c['latitude'], c['longitude']] for c in document.points