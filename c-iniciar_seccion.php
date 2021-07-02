<?php
include( "class/Csesiones.php" );
Csesiones::iniciar_sesion();
$_SESSION[ 'usuario' ] = "";
$seccion = "v-iniciar_seccion.php";




include("v-plantilla.php");

//header( "location: respuesta_registrarse.php" );