<?php
/** esta fucion permite ingresar ambientes a la base de datos 
 * param       numero           fecha                fecha en la que se regitra el usuario
 * param       texto            correo                el correo del ususuario
 * param       texto            nombre_usuario        es como se va ayamar el usuario
 * param       texto            clave                 clave que ingresa el usuario
*/
include_once('conexion.php');
class usuario extends conex
{
    function consultar_usuario (  $correo, $nombre_usuario, $clave )
    {
        $conexion=self::conectar();
        include_once('mensajes.php');
        $sql= " insert into usuario (fecha, clave, correo, nombre_usuario) values ( now(),'$clave', '$correo','$nombre_usuario')";
        $resultado = $conexion->query($sql);
        
    }
}

