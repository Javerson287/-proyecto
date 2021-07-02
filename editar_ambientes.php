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
select_id('ambientes','no',$id);
?>
<form action="" method="post">
	<input type="text" value="<?php echo $row->no;?>" name="no">
	<input type="text" value="<?php echo $row->cede;?>" name="cede">
	<input type="text" value="<?php echo $row->nom_aula;?>" name="nom_aula">
	<input type="submit" name="submit">
</form>

<?php
	
	if(isset($_POST['submit'])){
		$field = array("no"=>$_POST['no'], "cede"=>$_POST['cede'], "nom_aula"=>$_POST['nom_aula']);
		$tbl = "ambientes";
		edit($tbl,$field,'no',$id);
		header("location:c-editar_eliminar_ambientes.php");
	}
?>
</div>
</body>
</html>