DELETE FROM seaicedata
WHERE
    hemisphere = 'south';

WITH seaice as (SELECT year, hemisphere, AVG(CAST(extent AS float)) AS extent
FROM seaicedata
GROUP BY year,hemisphere
ORDER BY year DESC),

sealevel as (SELECT year, AVG(CAST(totalweightedobservations AS float)) AS totalweightedobservations, 
			 AVG(CAST(gmsl_gia AS float)) AS gmsl_gia
FROM sealeveldata
GROUP BY year
ORDER BY year DESC)

SELECT 
	seaice.year, 
	hemisphere, 
	extent, 
	totalweightedobservations, 
	gmsl_gia
INTO seadata
FROM seaice 
INNER JOIN sealevel ON seaice.year = sealevel.year

SELECT * FROM seadata

SELECT * FROM seaicedata;
SELECT * FROM sealeveldata;
