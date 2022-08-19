#!/bin/bash
#
#script archiva-files-zip-con-clave.sh
# Version : 2.0
#Para generar archivos compresos de los archivos .gz de un directorio y borra los originales
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2018-09-11

#script archiva-files-zip-con-clave.sh
#Para generar archivos compresos de los archivos .gz de un directorio y borra los originales

#
#
#===========================================================================
PATH=/bin:/usr/bin:/usr/sbin/
#===========================================================================

#Variables a cambiar según el sistema=======================================
###!!!!!!!! IMPORTANTE que los directorios de origen y destino inicien y terminen en "/"
#DIRECTORIOORIGEN="/var/respaldos/respaldos/"
DIRECTORIOORIGEN="/var/respaldos/respaldos/"
#DIRECTORIODESTINO="/var/respaldos/respaldos/"
DIRECTORIODESTINO="/var/respaldos/respaldos/"

#===========================================================================
FECHAINICIO=`date -d "last day" +%Y-%m-%d`
CADENALASTDAY="`echo $FECHAINICIO | sed 's/:/ /g'`"
RAIZLOGS="postgresql-"`echo $CADENALASTDAY`
ARCHIVO="postgreslogs-"`echo $CADENALASTDAY`".tar.bz2"
cd $DIRECTORIOORIGEN
CARPETA="`ls -R -a -x *.gz`"

                for LISTA in $CARPETA
                do
                        LISTA="`echo $LISTA | sed 's/:/ /g'`"
                        FILE=$LISTA
                        if [ -f "$FILE" ]
                        then
#                               echo "$FILE alli estaaaa!!!"
#                                echo "---------------------------INICIO---Archivos a comprimir------------------------------"
#                               tar -cjvf $DIRECTORIODESTINO$ARCHIVO $DIRECTORIOORIGEN$RAIZLOGS*.log
				ZFILE=`echo $FILE`".zip"
				 zip -P password $DIRECTORIODESTINO$ZFILE $DIRECTORIOORIGEN$FILE
#                                echo "---------------------------Archivo tar.gz creado:    ---------------------------------"
                                echo $FILE
                                echo $ZFILE
#                                echo "-------------------------------------------------------------------------------------"
#                                echo "-----------------------------------Archivos a borrar---------------------------------"
#                                ls $DIRECTORIOORIGEN$RAIZLOGS*.log
##                               rm -f $DIRECTORIOORIGEN$RFILE
#                                echo "--------------------------------------------------------------------------------------"
##                                break
                        else
#                             echo "$FILE alli no estaaa!!!."
                                echo "Archivo no encontrado"
                                break
                        fi
                done
                            
