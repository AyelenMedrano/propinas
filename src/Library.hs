module Library where
import PdePreludat

type Nombre = String
type Propina = Number


--Version 1
--cuantoPagar :: Number -> Nombre -> String -> Propina
--cuantoPagar costoComida "recomendada" _ = costoComida + criterioPropinaRecomendada costoComida 
--cuantoPagar costoComida "MrPink" _ = costoComida + criterioPropinaMrPink costoComida 
--cuantoPagar costoComida "conservador" _ = costoComida + criterioPropinaConservador costoComida 
--cuantoPagar costoComida "TioCarlos" mozo = costoComida + criterioPropinaSegunNombre costoComida mozo

--Version 2
cuantoPagar costoComida criterioPropina = costoComida + criterioPropina costoComida

criterioPropinaSegunNombre :: String -> Number -> Propina
criterioPropinaSegunNombre mozo costoComida | "Carlos" == mozo = ((*2) . criterioPropinaRecomendada) costoComida
                                            | otherwise = ((/2) . criterioPropinaRecomendada) costoComida

criterioPropinaMrPink :: Number -> Propina
criterioPropinaMrPink costoComida  = 0

criterioPropinaConservador :: Number -> Propina
criterioPropinaConservador costoComida  | esImpar costoComida = 25
                                        | otherwise = 20

criterioPropinaRecomendada :: Number -> Propina
criterioPropinaRecomendada  = (* 0.1)

esImpar :: Number -> Bool
esImpar = (odd . truncate)

--ALGO INTERESANTE EN LA FUNCION criterioPropinaSegunNombre
-- nos damos cuenta que le falta un parametro, el nombre del mozo
-- para arreglar esto el secreto esta en "crear" otra funcion ya con el parametro del nombre del mozo, cuando consulto
-- Por ejemplo, se consulta de esta manera:
-- *Spec Library Spec> cuantoPagar 600 (criterioPropinaSegunNombre "Carlos")
-- 700
-- Vemos que FUNCIONO!!!! Y nos dio un resultado correcto, en cambio si consulto esto:
-- *Spec Library Spec> cuantoPagar 600 criterioPropinaSegunNombre 
-- Me va a dar un ERROR de falta de parametro

--RECORDA LA VERSION 2 ES LA QUE DEBO UTILIZAR, EN LA VERSION 1 MATO GATITOS :c