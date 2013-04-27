ymaps.ready =>
  @map = new ymaps.Map 'map', {center: [50.45, 30.523], zoom: 11}
  myGeoObjects = document.points.map (c)-> new ymaps.GeoObject
    geometry: 
      type: "Point"
      coordinates: [c["latitude"], c["longitude"]]
    properties: 
      clusterCaption: 'Геообъект №1',
      balloonContentBody: 'Содержимое балуна геообъекта №1.'

  clusterer = new ymaps.Clusterer
  clusterDisableClickZoom: true
  clusterer.add myGeoObjects
  map.geoObjects.add(clusterer)

