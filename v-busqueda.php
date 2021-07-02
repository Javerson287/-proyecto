<?php

include 'conexion_busqueda.php';




if(!isset($_POST['buscar'])){

    $_POST['buscar']= "";

    $buscar = $_POST['buscar'];
}


$buscar = $_POST['buscar'];

$SQL_READ = "SELECT * FROM prestamo_ambientes WHERE cede like '%".$buscar."%'
OR fecha_prestamo LIKE'%".$buscar."%' ";

$sql_query = mysqli_query($conexion, $SQL_READ);

//echo $SQL_READ;
 
    