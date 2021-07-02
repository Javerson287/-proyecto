<?php 
include("function.php");
$id = $_GET['id'];
delete('programas','ficha',$id);
header("location:c-editar_eliminar_programas.php");
?>