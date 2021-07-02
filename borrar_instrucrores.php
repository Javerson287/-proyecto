<?php 
include("function.php");
$id = $_GET['id'];
delete('instructores','No_documento',$id);
header("location:c-editar_eliminar_instructores.php");
?>