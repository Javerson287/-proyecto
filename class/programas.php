<?php
include ('conexion.php');

class insertar_programa extends Conex
{

    static function insertar ($ficha, $nom_programa, $no_documento)
        {
            $conexion = Conex::conectar();
            $sql= " insert into programas (ficha, nom_programa, No_documento) values ('$ficha', '$nom_programa', '$no_documento')";
            $resultado = $conexion->query($sql);
            //echo $sql;
            if ($conexion ->affected_rows > 0)
            {
                
                header( "location: c-menu.php" );
            }
            else
            {
                header( "location: c-menu-programa.php" );
                
                
            }
        }
}