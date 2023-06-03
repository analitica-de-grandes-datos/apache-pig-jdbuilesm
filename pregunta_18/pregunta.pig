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
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

       /* >>> Escriba su respuesta a partir de este punto <<<*/

X = LOAD './data.csv' using PigStorage(',')
     AS (num:int, name:chararray, LASTNAME:chararray, time:chararray, color:chararray, otre:int);
Y = FOREACH X GENERATE name, color;
Z = FILTER Y BY NOT (color  MATCHES '.*b.*');
DUMP Y;

STORE Z INTO 'output/' using PigStorage(',');
