import 'ol/ol.css';
import './style.css';
import Map from 'ol/Map';
import View from 'ol/View';
import GeoJSON from 'ol/format/GeoJSON';
import TileLayer from 'ol/layer/Tile';
import VectorLayer from 'ol/layer/Vector';
import OSM from 'ol/source/OSM';
import VectorSource from 'ol/source/Vector';
import {fromLonLat} from 'ol/proj';
import {Fill, Stroke, Style} from 'ol/style';
import {stylefunction} from 'ol-mapbox-style';

const overtureLayer = new VectorLayer({
  source: new VectorSource({
    url: '/overture.geojson',
    format: new GeoJSON()
  }),
  visible: true
});

const myBuildingsLayer = new VectorLayer({
  source: new VectorSource({
    url: '/buildings.geojson',
    format: new GeoJSON()
  }),
  style: new Style({
    fill: new Fill({color: 'rgba(32, 129, 72, 0.22)'}),
    stroke: new Stroke({color: '#14532d', width: 2})
  }),
  visible: true
});

fetch('/overture-style.json')
  .then((response) => response.json())
  .then((style) => stylefunction(overtureLayer, style, 'overture'))
  .catch(() => {
    overtureLayer.setStyle((feature) => {
      const sourceType = feature.get('source_type');
      const color = sourceType === 'my' ? '#1a9850' : sourceType === 'osm' ? '#2b6cb0' : '#f59e0b';
      return new Style({
        fill: new Fill({color: `${color}80`}),
        stroke: new Stroke({color: '#ffffff', width: 1})
      });
    });
  });

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({source: new OSM()}),
    overtureLayer,
    myBuildingsLayer
  ],
  view: new View({
    center: fromLonLat([50.66256, 53.2829]),
    zoom: 18
  })
});

const toggles = new globalThis.Map([
  ['overture-toggle', overtureLayer],
  ['my-buildings-toggle', myBuildingsLayer]
]);

for (const [id, layer] of toggles) {
  const control = document.getElementById(id);
  control.checked = layer.getVisible();
  control.addEventListener('change', (event) => {
    layer.setVisible(event.target.checked);
  });
}
