Crear paquetes desde repo APT
===================
1 - Guardar en un fichero la lista de paquetes a crear (ordenados por dependencias, si el paquete A depende del B, A tiene que ir debajo de B). Ejemplo:
<pre>
ros-kinetic-camera-calibration-parsers
ros-kinetic-camera-info-manager
ros-kinetic-catkin
ros-kinetic-class-loader
</pre>

2 - Ejecutar:
<pre>
./download.sh nombre_fichero
</pre>

3 - Ejecutar:

<pre>
./makePkg.sh directories.txt
</pre>

En este paso se ira abriendo con sublime el directorio del paquete para comprobar que los ficheros "debian/control" y los de python estan preparados. Si es así pulsar intro para continuar
