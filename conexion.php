<?php
class Conex
{
    static function conectar()
    {
         $conexion = mysqli_connect("localhost","root","","proyecto");
         return $conexion;
         
    }
    
    
}