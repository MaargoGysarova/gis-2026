# Лабораторная работа 3

Проект сравнивает здания из Lab1 Маргариты Гусаровой с набором Overture Buildings.

## Подготовка данных

SQL-скрипт читает `lab1/buildings.geojson`, строит bbox по зданиям и выгружает найденные объекты Overture в `client/public/overture.geojson`.

Запускать из папки этой лабораторной:

```bash
duckdb lab3/lab3.duckdb < lab3/sql/overture_buildings.sql
```

В результате в DuckDB создаются таблицы `my_buildings`, `my_bbox`, `overture_partitions`, `overture_buildings_raw`, `overture_buildings`.

## Запуск клиента

```bash
cd client
npm install
npm run dev
```

На карте отображаются два слоя: здания из Lab1 и Overture Buildings. Цвета Overture соответствуют полю `source_type`: `my`, `osm`, `ml`.
