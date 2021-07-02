<?php
include ('conexion.php');

class disponible extends Conex
{
    static function disponibilidad($b)
    {
        $conexion = Conex::conectar();
        
        $sql = "call disponibilidad('$b')";
       
        $resultado = $conexion->query($sql);
        
        //echo $sql;
        return $resultado;
    }
}