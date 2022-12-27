import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String
  }

  connect() {
    console.log(window.scrollY);
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v11', // style URL
      center: [26.117850, 44.444990], // starting position [lng, lat]
      zoom: 12
    });

    this.map.on('load', () => {
      this.map.addSource('bucharest', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'geometry': {
            'type': 'Polygon',
            'coordinates': [
              [
                [26.133481, 44.462023],
                [26.127162, 44.465761],
                [26.106028, 44.457162],
                [26.101011, 44.460092],
                [26.094876, 44.459319],
                [26.086396, 44.452364],
                [26.090835, 44.445666],
                [26.095743, 44.440668],
                [26.098414, 44.434871],
                [26.103538, 44.428970],
                [26.103971, 44.426779],
                [26.126994, 44.425490],
                [26.131508, 44.421991],
                [26.136842, 44.419773],
                [26.139374, 44.430102],
                [26.137056, 44.435794],
                [26.135672, 44.438966],
                [26.134106, 44.440835],
                [26.131348, 44.442451],
                [26.129149, 44.443723],
                [26.134878, 44.446235],
                [26.127261, 44.453013],
                [26.133398, 44.462111],
                [26.133481, 44.462023]
              ]
            ]
          }
        }
      });

      this.map.addLayer({
        'id': 'bucharest',
        'type': 'fill',
        'source': 'bucharest',
        'layout': {},
        'paint': {
          'fill-color': '#0080ff',
          'fill-opacity': 0.5
        }
      });

      this.map.addLayer({
        'id': 'outline',
        'type': 'line',
        'source': 'bucharest',
        'layout': {},
        'paint': {
          'line-color': '#000',
          'line-width': 3
        }
      });
    });
  }
}
