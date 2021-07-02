<?php

    include( "class/consulta.php" );
    include( "class/Csesiones.php" );
    include( "class/Vimprimir.php" );
    Csesiones::iniciar_sesion();

    $usuario = $_POST[ 'usuario' ];
    $clave = $_POST[ 'clave' ];

    echo $usuario." ".$clave;

    $r = consulta::autenticacion( $usuario, $clave );
    $r = Vimprimir::imprimir( $r, 1 ); 

    //Imprimir si estamos autenticados o no.
    if( $r."" == "1" )
    {
        
        $_SESSION[ 'usuario' ] = $usuario;
        header( "location: c-menu.php" );

    }else{
            header( "location: c-iniciar_seccion.php" );
        }