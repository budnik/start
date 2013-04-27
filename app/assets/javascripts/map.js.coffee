ymaps.ready ->
  unless @haveMap?
    map = new ymaps.Map 'map', {center: [50.45, 30.523], zoom: 11}
    @haveMap = true
    marks = (new ymaps.Placemark [c['latitude'], c['longitude']] for c in document.points)
    marks.map (m)->
      map.geoObjects.add m