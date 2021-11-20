CREATE TABLE seaice (
Year int,
Month int,
Day int,
Extent double precision,
Missing double precision,
Source_data varchar,
hemisphere varchar
);

CREATE TABLE sealevel (
Year int,
TotalWeightedObservations double precision,
GMSL_noGIA double precision,
StdDevGMSL_noGIA double precision,
SmoothedGMSL_noGIA double precision,
GMSL_GIA double precision,
StdDevGMSL_GIA double precision,
SmoothedGMSL_GIA double precision,
SmoothedGMSL_GIA_sigremoved double precision
);

SELECT * FROM  seaice

-- remove source_data column as it is not relevant to our analysis
ALTER TABLE seaice
DROP source_data;

-- select only colums that are needed for our analysis
SELECT year, extent, hemisphere
FROM seaice;

Drop table seaicedata

-- Group data by year and hemisphere and order by year
SELECT year, AVG(extent),hemisphere
INTO seaicedata
FROM seaice
GROUP BY year, hemisphere
ORDER BY year

-- Remove south hemisphere
DELETE FROM seaicedata
WHERE hemisphere = 'south';

-- Change column name for column avg to north_extent
ALTER TABLE seaicedata
RENAME COLUMN avg TO north_extent;

SELECT * FROM seaicedata

SELECT * FROM sealevel

-- select only colums that are needed for our analysis
SELECT year, gmsl_gia
FROM sealevel;

-- Group data by year and hemisphere and order by year
SELECT year, AVG(gmsl_gia)
INTO sealeveldata
FROM sealevel
GROUP BY year 
ORDER BY year

-- Change column name for column avg to gmsl_gia
ALTER TABLE sealeveldata
RENAME COLUMN avg TO gmsl_gia;

SELECT * FROM sealeveldata

-- Join seaicedata and sealeveldata on the year

SELECT 
seaicedata.year, 
hemisphere, north_extent, gmsl_gia
INTO seadata
FROM seaicedata INNER JOIN sealeveldata ON seaicedata.year = sealeveldata.year

SELECT * FROM seadata
