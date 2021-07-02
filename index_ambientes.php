<!doctype html>
<html>
<head>

<title>Editar </title>

</head>

<body>
<div class="main-wrapper">
<h1>Editar Registros de Ambientes </h1>
<br><br>

<?php
	include("function.php");
?>
<table border="1" width="100%">


	
	<tr>
		<th width="41%">No</th>
		<th width="47%">Cede</th>
		<th width="41%">Nombre de Aula</th>
		<th width="50%">Opciones</th>
	</tr>
<?php 
	$sql = "select * from ambientes";
	$result = db_query($sql);
	while($row = mysqli_fetch_object($result)){
	?>
	<tr>
		<td><?php echo $row->no;?></td>
		<td><?php echo $row->cede;?></td>
		<td><?php echo $row->nom_aula;?></td>
		<td>
<a href="editar_ambientes.php?id=<?php echo $row->no; ?>">
<input type="submit" class="btn btn-primary btn-block"  name="submit" value="actualizar"></a>
<br><br>
<a  href="borrar_ambientes.php?id=<?php echo $row->no;?>">
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