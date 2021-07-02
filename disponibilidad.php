<?php
$b = $_POST['fecha'];
$b .= " ";
$b .= $_POST['hora'];
include( "class/diponibilidad1.php" );
include( "class/Vimprimir.php" );
$r = disponible::disponibilidad( $b );
$r = Vimprimir::imprimir( $r );
include( "r-disponibilidad.php" );
