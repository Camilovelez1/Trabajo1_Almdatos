CREATE SCHEMA ideam;
GO;

CREATE EXTERNAL FILE FORMAT CsvFormat
     WITH (
         FORMAT_TYPE = DELIMITEDTEXT,
         FORMAT_OPTIONS(
         FIELD_TERMINATOR = ',',
         STRING_DELIMITER = '"',
         FIRST_ROW=2
         )
     );
 GO;

 CREATE EXTERNAL TABLE ideam.histdata
 (
     CodigoEstacion VARCHAR(12),
     Entidad VARCHAR(100),
     Etiqueta VARCHAR(20),
     Fecha DATETIME,
     Valor DECIMAL(18,2)
 )
 WITH
 (
     DATA_SOURCE =ideam,
     LOCATION = 'trusted/hist_data/*.csv',
     FILE_FORMAT = CsvFormat
 );
 GO