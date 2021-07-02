<?php

    include("class/programas.php");
    $ficha = $_POST[ 'ficha' ];
    $nom_programa = $_POST[ 'nombre' ];
    $No_documento= $_POST[ 'instructor' ];
  
    if ($ficha == true && $nom_programa== true )
    {
      
        insertar_programa::insertar($ficha, $nom_programa, $No_documento);
        
       
        
    }
    else{
       
       header( "location: c-menu-programa.php" );
    }