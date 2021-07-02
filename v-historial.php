<html>

<head>


<title></title>



</head>

<body>


<div id="header">
			<ul class="nav">
				
				<li><a href="c-menu.php">Inicio</a></li>
				<li><a href="c-historial.php">Realizar otra Busqueda</a></li>
			</ul>
		</div>
		</h1>


<form action="c-historial.php" method="POST">
            
        <div id = centrar> 


           
            <div class="field" id="buscar">

            
      <input type="text" id="buscar" name= "buscar" placeholder="Buscar Registro"/>

            </div>

            <div class = "bs">
              
            </div>


      

            <table class="table" border=2px>
      <thead><br>
      <div>
            <th>No</th>
            <th>Id</th>
            <th>Fecha Registro</th>
            <th>Cede</th>
            <th>Hora Ingreso</th>
            <th>Hora Salida</th> 
            <th>Observaciones</th>
            <th>Fecha prestamo</th>
            <th>Fecha devolucion</th>
        </div>
   </thead>

<tbody>



<?php

include "v-busqueda.php";

while($row= mysqli_fetch_array($sql_query)){?>

<tr> 
                <td><?=$row['no'] ?></td>
                <td><?=$row['id']?></td>
                <td><?=$row['fecha_registro']?></td>
                <td><?=$row['cede']?></td>
                <td><?=$row['hora_ingreso']?></td>
                <td><?=$row['hora_salida']?></td>
                <td><?=$row['observaciones']?></td>
                <td><?=$row['fecha_prestamo']?></td>
                <td><?=$row['fecha_devolucion']?></td>
            </tr>


<?php }


?></table></form>

<form action=""><INPUT TYPE="SUBMIT" value="Generar PDF" name=buscar onClick="window.open('pdf.php?id=<?php echo $buscar?> '); "></form>




</body>
</html>

