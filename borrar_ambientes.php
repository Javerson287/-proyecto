<?php 
include("function.php");
$id = $_GET['id'];
delete('ambientes','no',$id);
header("location:c-editar_eliminar_ambientes.php");
?>