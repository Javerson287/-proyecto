<?php
include ('conexion.php');

class prestamos extends Conex
{
    static function ingresar_prestamo($f_prestamo, $f_devolucion, $h_ingreso, $h_salida, $ambiente, $observaciones)
    {
        $conexion = Conex::conectar();
        $usuario = "1";
       
        $p = explode (" ",$ambiente);
        $sql = "insert into prestamo_ambientes(cede,hora_ingreso, hora_salida, observaciones, no, id, fecha_prestamo, fecha_devolucion)";
        $sql .= "values('$p[1]','$h_ingreso', '$h_salida', '$observaciones', '$p[0]', '$usuario', '$f_prestamo', '$f_devolucion')";
        $resultado = $conexion->query($sql);
        echo $sql;
        if ($conexion ->affected_rows > 0)
        {
            echo "tus datos se guardaron";
        }
        else
        {
            echo "tus datos no se guardaron";
        }
    }
}