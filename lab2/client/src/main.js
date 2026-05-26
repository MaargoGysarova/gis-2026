import 'ol/ol.css';
import './style.css';
import Map from 'ol/Map';
import View from 'ol/View';
import ImageLayer from 'ol/layer/Image';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import ImageWMS from 'ol/source/ImageWMS';
import {fromLonLat} from 'ol/proj';

const geoserverWmsUrl = 'http://localhost:8080/geoserver/gis/wms';

function createWmsLayer(layerName, visible = true, opacity = 0.75) {
  return new ImageLayer({
    source: new ImageWMS({
      url: geoserverWmsUrl,
      params: {
        LAYERS: `gis:${layerName}`,
        VERSION: '1.1.0',
        FORMAT: 'image/png',
        TRANSPARENT: true
      },
      ratio: 1,
      serverType: 'geoserver',
      crossOrigin: 'anonymous'
    }),
    opacity,
    visible
  });
}

const buildingsLayer = createWmsLayer('buildings', true, 0.82);
const landuseLayer = createWmsLayer('landuse_areas', true, 0.45);
const poisLayer = createWmsLayer('pois', true, 0.9);

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({source: new OSM()}),
    landuseLayer,
    buildingsLayer,
    poisLayer
  ],
  view: new View({
    center: fromLonLat([50.66256, 53.2829]),
    zoom: 18
  })
});

const toggles = new globalThis.Map([
  ['buildings-toggle', buildingsLayer],
  ['landuse-toggle', landuseLayer],
  ['pois-toggle', poisLayer]
]);

for (const [id, layer] of toggles) {
  const control = document.getElementById(id);
  control.checked = layer.getVisible();
  control.addEventListener('change', (event) => {
    layer.setVisible(event.target.checked);
  });
}
