<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Editar Registros</title>

<link type="text/css" href="bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="css/estilo2.css" rel="stylesheet">


</head>

<body>
<div class="main-wrapper">
<h1>Editar Registros  </h1>
<br><br>
<?php 
include("function.php");
$id = $_GET['id'];
select_id('programas','ficha',$id);
?>
<form action="" method="post">
	<input type="text" value="<?php echo $row->ficha;?>" name="ficha">
	<input type="text" value="<?php echo $row->nom_programa;?>" name="nom_programa">
	<input type="text" value="<?php echo $row->No_documento;?>" name="No_documento">
	<input type="submit" name="submit">
</form>

<?php
	
	if(isset($_POST['submit'])){
		$field = array("ficha"=>$_POST['ficha'], "nom_programa"=>$_POST['nom_programa'], "No_documento"=>$_POST['No_documento']);
		$tbl = "programas";
		edit($tbl,$field,'ficha',$id);
		header("location:c-editar_eliminar_programas.php");
	}
?>
</div>
</body>
</html>