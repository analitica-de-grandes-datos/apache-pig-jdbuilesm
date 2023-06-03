/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u 
   WHERE 
       color REGEXP '^b';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
X = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
Y = FILTER X BY color matches '^b.*' ;
Z = FOREACH Y GENERATE name, color;
STORE Z INTO 'output/' using PigStorage(',');

