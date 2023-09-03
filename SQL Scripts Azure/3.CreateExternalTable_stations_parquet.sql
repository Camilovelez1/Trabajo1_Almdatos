-- Format for table files
CREATE EXTERNAL FILE FORMAT ParquetFormat
    WITH (
            FORMAT_TYPE = PARQUET,
            DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
        );
GO;
 
 
 
 CREATE EXTERNAL TABLE ideam.stations

 WITH
 (
     DATA_SOURCE =ideam,
     LOCATION = '/refined/aux_data/stations_catalog/',
     FILE_FORMAT = ParquetFormat
 )
 AS
 SELECT *
 FROM
     OPENROWSET(
         BULK 'trusted/aux_data/stations_catalog/*.parquet',
         DATA_SOURCE = ideam,
         FORMAT = 'PARQUET'
     ) AS stations
 ;
 GO