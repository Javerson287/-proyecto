<?php

    include("class/usuario.php");
    $correo = $_POST[ 'correo' ];
    $usuario = $_POST[ 'usuario' ];
    $clave = $_POST[ 'contraseña' ];
    $clave2= $_POST[ 'c_contraseña' ];
    
    if ($clave == $clave2)
    {
       echo("Las dos claves son iguales...");
       usuario::consultar_usuario(  $correo, $usuario, $clave );
       header( "location: c-iniciar_seccion.php" );

    }
    else{
       echo("Las dos claves son distintas...");
       header( "location: c-registrarse.php" );
    }

    

