<?php
include ('conexion.php');

class insertar_instructores extends Conex
{

    static function insertar ($No_documento, $nom_instructor, $no)
        {
            $conexion = Conex::conectar();
            $sql= " insert into instructores ( No_documento, nom_instructor, no) values ('$No_documento', '$nom_instructor', '$no')";
            $resultado = $conexion->query($sql);
            if ($conexion ->affected_rows > 0)
            {
                
                header( "location: c-menu.php" );
            }
            else
            {
                header( "location: c-menu-instructores.php" );
                
                
            }
        }
}