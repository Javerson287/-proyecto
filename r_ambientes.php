<?php

    include("class/ambientes.php");
    $cede = $_POST[ 'cede' ];
    $nom_aula = $_POST[ 'ambiente' ];
  
    if ($cede == true && $nom_aula== true)
    {
      
        ambientes::ingresar_ambientes(  $cede, $nom_aula );
        header( "location: c-menu.php" );
       

    }
    else{
       
       header( "location: c-menu_ambientes.php" );
    }