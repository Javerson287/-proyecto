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
select_id('instructores','No_documento',$id);
?>
<form action="" method="post">
	<input type="text" value="<?php echo $row->No_documento;?>" name="No_documento">
	<input type="text" value="<?php echo $row->nom_instructor;?>" name="nom_instructor">
	<input type="submit" name="submit">
</form>

<?php
	
	if(isset($_POST['submit'])){
		$field = array("No_documento"=>$_POST['No_documento'], "nom_instructor"=>$_POST['nom_instructor']);
		$tbl = "instructores";
		edit($tbl,$field,'No_documento',$id);
		header("location:c-editar_eliminar_instructores.php");
	}
?>
</div>
</body>
</html>