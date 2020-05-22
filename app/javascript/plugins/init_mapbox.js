import mapboxgl from 'mapbox-gl';

// const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = "pk.eyJ1IjoidWdvY2FzIiwiYSI6ImNrOW81cmFkZzAyejAzbXA3aXVmZTV2dWMifQ.O7i7fcx3QvyNbeJvw6wM4A";
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  if (document.getElementById('map')) {
    const mapElement = document.getElementById('map');
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers)
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
