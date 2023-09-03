CREATE DATABASE DataIDEAM
  COLLATE Latin1_General_100_BIN2_UTF8;
GO;

 Use DataIDEAM;
 GO;

 CREATE EXTERNAL DATA SOURCE ideam WITH (
     LOCATION = 'https://datalakeclimaticchange.dfs.core.windows.net/filesystemclimaticchange/datasets_ideam/'
 );
 GO;