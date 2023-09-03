 CREATE EXTERNAL FILE FORMAT CsvFormat2
     WITH (
         FORMAT_TYPE = DELIMITEDTEXT,
         FORMAT_OPTIONS(
         FIELD_TERMINATOR = ',',
         STRING_DELIMITER = '"',
         FIRST_ROW=2
         )
     );
 GO;
 
 
 CREATE EXTERNAL TABLE ideam.variables2
 (
     TipoRed VARCHAR(100),
     Parametro VARCHAR(100),
     Etiqueta VARCHAR(100),
     Unidad VARCHAR(100),
     Periodo VARCHAR(100),
     Descripcion VARCHAR(100)
 )
 WITH
 (
     DATA_SOURCE =ideam,
     LOCATION = 'trusted/aux_data/variables_catalog/*.csv',
     FILE_FORMAT = CsvFormat2
 );
 GO