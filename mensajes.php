<?php
class mensajes
{
    static function m_amb($conexion)
    {
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
