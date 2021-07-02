<?php

    class Vimprimir
    {
        static function imprimir( $resultado, $des = null )
        {
            return self::organizar( $resultado, $des );
        }

        static function organizar( $resultado, $des = null )
        {
            $salida = "";
            $id = "";

            if( $des == null ) $salida .= "<table border='1px'>";

            while( $fila = mysqli_fetch_array( $resultado ) )
            {
                if( $des == null ) $salida .= "<tr>";

                for( $i = 0; $i < mysqli_num_fields( $resultado ); $i ++ )
                {
                    if( $i == 0 ) $id = $fila[ 0 ]; 

                    if( $des == null ) $salida .= "<td>";
                    $salida .= $fila[ $i ];
                    if( $des == null ) $salida .= "</td>";

                }

                if( $des == null ) $salida .= "</tr>";
            }            

            if( $des == null ) $salida .= "</table>";

            return $salida;
        }
    }
    