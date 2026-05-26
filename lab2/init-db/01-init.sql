CREATE EXTENSION IF NOT EXISTS postgis;

DROP TABLE IF EXISTS buildings;
DROP TABLE IF EXISTS landuse_areas;
DROP TABLE IF EXISTS pois;
DROP TABLE IF EXISTS tmp_layer;

CREATE TABLE tmp_layer (
    osm_id text PRIMARY KEY,
    changeset text,
    feature_type text,
    building text,
    building_levels integer,
    height numeric,
    addr_city text,
    addr_place text,
    addr_street text,
    addr_housenumber text,
    landuse text,
    amenity text,
    leisure text,
    name text,
    shelter_type text,
    bench text,
    lit text,
    geom geometry(Geometry, 4326) NOT NULL
);

INSERT INTO tmp_layer (
    osm_id, changeset, feature_type, building, building_levels, height,
    addr_city, addr_place, addr_street, addr_housenumber, landuse,
    amenity, leisure, name, shelter_type, bench, lit, geom
) VALUES
('way/1354876394', '182552741', 'landuse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'allotments', NULL, NULL, 'СНТ Автохозяйства', NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6625635,53.2832849],[50.6628028,53.2828441],[50.6628299,53.2828042],[50.662855,53.2827589],[50.6633845,53.2818037],[50.662613,53.2816725],[50.6618485,53.2832426],[50.6619406,53.2833314],[50.6619759,53.2834669],[50.6620538,53.2836192],[50.6624077,53.2834372],[50.6625635,53.2832849]]]}'), 4326)),
('way/1495700907', '182554078', 'building', 'house', NULL, NULL, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.662001,53.2833215],[50.6620663,53.2831666],[50.6624818,53.2832477],[50.6623799,53.2833872],[50.662001,53.2833215]]]}'), 4326)),
('way/1495700908', '182554078', 'building', 'house', 2, 5.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6623043,53.283117],[50.6625301,53.2831654],[50.6625892,53.2830646],[50.6624715,53.2830429],[50.6623503,53.2830204],[50.6623224,53.2830673],[50.6623043,53.283117]]]}'), 4326)),
('way/1495700909', '182552741', 'building', 'garage', 1, 3.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6623503,53.2830204],[50.6624715,53.2830429],[50.6624971,53.2829898],[50.6623789,53.2829643],[50.6623503,53.2830204]]]}'), 4326)),
('way/1495700910', '182554078', 'building', 'house', 2, 5.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6626875,53.2828972],[50.6627425,53.2827882],[50.6624895,53.2827416],[50.6624278,53.2828508],[50.6626875,53.2828972]]]}'), 4326)),
('way/1495700911', '180784638', 'leisure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sauna', NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6622716,53.2828131],[50.6622926,53.282759],[50.6621789,53.2827364],[50.6621666,53.2827606],[50.662156,53.2827941],[50.6622716,53.2828131]]]}'), 4326)),
('way/1495700912', '182554078', 'building', 'house', 1, 3.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6625424,53.2827264],[50.6626223,53.2827398],[50.6626604,53.2826836],[50.6625825,53.2826647],[50.6625424,53.2827264]]]}'), 4326)),
('way/1495700913', '182552741', 'building', 'yes', NULL, NULL, NULL, 'СНТ Автохозяйства', NULL, NULL, NULL, 'shelter', NULL, NULL, 'gazebo', 'yes', 'yes', ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6622155,53.283017],[50.6622246,53.2829968],[50.662264,53.2830031],[50.6622548,53.2830233],[50.6622155,53.283017]]]}'), 4326)),
('way/1495700914', '182554078', 'building', 'house', 2, 5.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6627451,53.2831083],[50.662882,53.2831225],[50.662892,53.2830896],[50.6629017,53.2830596],[50.662771,53.283048],[50.662759,53.2830733],[50.6627451,53.2831083]]]}'), 4326)),
('way/1495700915', '182554078', 'building', 'house', 1, 3.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6627672,53.2829844],[50.6628551,53.2829985],[50.6628689,53.2829712],[50.6628759,53.2829306],[50.662786,53.282923],[50.6627771,53.2829519],[50.6627672,53.2829844]]]}'), 4326)),
('way/1495700916', '182554078', 'building', 'house', 3, 7.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6628028,53.2828441],[50.6629402,53.2828603],[50.6630032,53.2828672],[50.6630201,53.2828119],[50.6629717,53.2827726],[50.662855,53.2827589],[50.6628299,53.2828042],[50.6628028,53.2828441]]]}'), 4326)),
('way/1512542653', '182554078', 'building', 'house', 1, 5.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.66262,53.2826155],[50.662747,53.2826368],[50.6627872,53.2825803],[50.6626576,53.2825531],[50.6626398,53.2825858],[50.66262,53.2826155]]]}'), 4326)),
('way/1512542654', '182554078', 'building', 'house', 2, 5.0, 'Усть-Кинельский', 'СНТ Автохозяйства', '7-я линия', '14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon","coordinates":[[[50.6626912,53.2824993],[50.6628396,53.2825184],[50.662862,53.2824589],[50.6627221,53.2824368],[50.6626912,53.2824993]]]}'), 4326));

CREATE TABLE buildings AS
SELECT
    osm_id,
    changeset,
    building,
    building_levels,
    height,
    addr_city,
    addr_place,
    addr_street,
    addr_housenumber,
    ST_Multi(geom)::geometry(MultiPolygon, 4326) AS geom
FROM tmp_layer
WHERE building IS NOT NULL
  AND ST_GeometryType(geom) IN ('ST_Polygon', 'ST_MultiPolygon');

ALTER TABLE buildings ADD PRIMARY KEY (osm_id);

CREATE TABLE landuse_areas AS
SELECT
    osm_id,
    changeset,
    COALESCE(landuse, leisure, amenity, feature_type) AS area_type,
    landuse,
    leisure,
    amenity,
    name,
    ST_Multi(geom)::geometry(MultiPolygon, 4326) AS geom
FROM tmp_layer
WHERE building IS NULL
  AND (landuse IS NOT NULL OR leisure IS NOT NULL OR amenity IS NOT NULL)
  AND ST_GeometryType(geom) IN ('ST_Polygon', 'ST_MultiPolygon');

ALTER TABLE landuse_areas ADD PRIMARY KEY (osm_id);

CREATE TABLE pois AS
SELECT
    osm_id,
    changeset,
    COALESCE(name, amenity, leisure, landuse, building) AS name,
    amenity,
    leisure,
    landuse,
    shelter_type,
    bench,
    lit,
    ST_PointOnSurface(geom)::geometry(Point, 4326) AS geom
FROM tmp_layer
WHERE amenity IS NOT NULL
   OR leisure IS NOT NULL
   OR name IS NOT NULL;

ALTER TABLE pois ADD PRIMARY KEY (osm_id);

CREATE INDEX idx_tmp_layer_geom ON tmp_layer USING gist (geom);
CREATE INDEX idx_buildings_geom ON buildings USING gist (geom);
CREATE INDEX idx_landuse_areas_geom ON landuse_areas USING gist (geom);
CREATE INDEX idx_pois_geom ON pois USING gist (geom);
