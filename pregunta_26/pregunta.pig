/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
        C = FOREACH B GENERATE name, color;
        STORE C INTO 'output/' using PigStorage(',');
*/
X = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
Y = FILTER X BY SUBSTRING(name,0,1) >= 'M';
Z = FOREACH Y GENERATE name;
STORE Z INTO 'output/' using PigStorage(',');
