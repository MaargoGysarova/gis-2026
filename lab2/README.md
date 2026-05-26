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

В GeoServer нужно создать workspace `gis`, store PostGIS с подключением к контейнеру `postgis`, затем опубликовать таблицы `buildings`, `landuse_areas`, `pois`.

Клиент:

```bash
cd client
npm install
npm run dev
```
