# INSTRUCCIONES



Este repositorio ha sido creado para :
- Servir como punto de partida de vuestra segunda tarea. 
- Servir para el equipo con el fin de tener un control de versiones adecuado y por último 
- Servir como alojamiento del entregable que constará fundamentalmente y necesariamente de los dos subdirectorios identificados como entregables y que contienen a su vez instrucciones específicas para hacer una entrega correcta.

Se os ha colocado un ejemplo de entregable para que veais cómo debería ser la entrega

## Diseño
Se os proporciona el ASM de la solución

![ASM](imagenes/ASM_booth_modificado.jpg) 

Para ayudaros a la visión general de los componentes generales necesarios que se implican por el ASM anterior, incluimos el siguiente esquema:

![Esquema](imagenes/ESQUEMA_booth_modificado.jpg) 

## Verificación

Con el fin de que podáis probar vuestro banco de verificación cuanto antes  sin necesidad de tener el diseño terminado, se os proporciona  un multiplicador de pruebas (multipli_parallel.sv) con tamaño de palabras y ciclos para obtener el resultado de la multiplicacion parametrizables, así como  un test_bench básico del mismo (tb_multipli.sv) para comprender su funcionamiento. Este diseño lo podéis utilizar como DUV alternativo hasta disponer del DUV definitivo que hayan estado generando vuestros compañeros dedicados al diseño.

 

## Entregable

Se os proporciona un ejemplo completo de entregable que consiste en la verificación con systemverilog de una FIFO, en este caso basada en una RAM de doble puerto.

Si quereis ejecutar el ejemplo, muévete al directorio ejemplo_entregable/verificacion_entegable y ejecuta

` vsim -do script_rtl_2018_ver1.do `

- en caso de trabajar con linux
- en el caso de trabajar con windows , ejecuta el mismo script una vez arrancado questasim



