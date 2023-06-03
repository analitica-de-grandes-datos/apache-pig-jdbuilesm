/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

X = LOAD './data.csv' using PigStorage(',') AS (id:int,  name:chararray, lastname:chararray,   date:chararray,  color:chararray, other:int);
Y = FOREACH X GENERATE SUBSTRING(date, 0, 4) AS yearBirthday;
Z = GROUP Y BY yearBirthday;
A = FOREACH Z GENERATE $0, COUNT($1);
STORE A INTO 'output/' using PigStorage(',');
