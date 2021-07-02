<?php

    include("class/instructores.php");
    $No_documento = $_POST[ 'CC' ];
    $nom_instructor = $_POST[ 'nombre' ];
    $no= $_POST[ 'ambiente' ];
  
    if ($No_documento == true && $nom_instructor== true )
    {
      
        insertar_instructores::insertar($No_documento, $nom_instructor, $no);
        
       
        
    }
    else{
       
       header( "location: c-menu-instructores.php" );
    }