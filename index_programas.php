<!doctype html>
<html>
<head>

<title>Editar </title>

</head>

<body>
<div class="main-wrapper">
<h1>Editar Registros de Programas</h1>
<br><br>

<?php
	include("function.php");
?>
<table border="1" width="100%">


	
	<tr>
		<th width="41%">Ficha</th>
		<th width="47%">Nombre de Programa</th>
		<th width="41%">Numero de Documento</th>
		<th width="50%">Opciones</th>
	</tr>
<?php 
	$sql = "select * from programas";
	$result = db_query($sql);
	while($row = mysqli_fetch_object($result)){
	?>
	<tr>
		<td><?php echo $row->ficha;?></td>
		<td><?php echo $row->nom_programa;?></td>
		<td><?php echo $row->No_documento;?></td>
		<td>
<a href="editar_programas.php?id=<?php echo $row->ficha; ?>">
<input type="submit" class="btn btn-primary btn-block"  name="submit" value="actualizar"></a>
<br><br>
<a  href="borrar_programas.php?id=<?php echo $row->ficha;?>">
<input type="submit" class="btn btn-primary btn-block"  name="submit" value="Eliminar"></a>
<br><br>

  </td>
  
	</tr>
	
	<?php } ?>
	
	<a  href="c-menu.php">
<input type="submit" class="btn btn-primary btn-block"  name="submit" value="Volver"></a>
	<br><br>
</table>
</div>
</body>
</html>