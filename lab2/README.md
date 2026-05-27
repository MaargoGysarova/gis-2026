# Лабораторная работа 2

Проект публикует данные из первой лабораторной работы Маргариты Гусаровой через PostGIS, GeoServer и OpenLayers.

## Состав данных

- `buildings.geojson` и `geo.osm` взяты из `MaargoGysarova/gis-2026/lab1`.
- В `init-db/01-init.sql` создаются таблицы `tmp_layer`, `buildings`, `landuse_areas`, `pois`.
- `pois` строится через `ST_PointOnSurface` для объектов, у которых есть `amenity`, `leisure` или `name`, потому что исходный GeoJSON содержит только полигональные объекты.

## Запуск

```bash
docker compose up -d
```

GeoServer: `http://localhost:8080/geoserver`, логин `admin`, пароль `geoserver`.

GeoServer уже настроен через volume `./geoserver_data:/opt/geoserver/data_dir`.
После запуска контейнеров в workspace `gis` доступны слои `buildings`, `landuse_areas`, `pois`.

Клиент:

```bash
cd client
npm install
npm run dev
```
