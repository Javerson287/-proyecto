<html>
<head>
<title></title>

</head>


<body>


            
      <div id = centrar>
            <h1>TypKey</h1>
            <hr style="height:2px;border-width:0;background-color:blue">
            
       </div>

       <br>

            <form action="r_instructor.php" method="POST">
           
            <table> 

            <td><label for="imp"><h1>Agregar Instructor</label></h1></td>
            <td><input type="button" onclick="history.back()"class="btn btn-primary btn-block" name="volver atrás" value="volver"></td>
            <tr>

            <td><label for="imp"><h1>CC:</label></td></h1>
            <td><input type="number" name="CC" id="imp"></td></tr>
            <tr>

            <td><label for="imp"><h1>Nombres y Apellidos:</label></td></h1>
            <td><input type="text" name="nombre" id="imp"></td></tr>
            <tr>

            <td><label for="imp"><h1>Ambiente:</label></td></h1>
            <td>

            <select name="ambiente">
        <?php
            //se realiza la conexion con la base de datos
            include('class/conexion.php');
            $conexion = conex::conectar();
            $sql = "select no, cede, nom_aula from ambientes";
            //echo $sql;
            $resultado = $conexion->query($sql);
            //se crea l alista de los ambientes
            while($fila = mysqli_fetch_array($resultado) )
            {
                $ambiente = $fila[ 'no'];
                $ambiente .= "  ";
                $ambiente .= $fila[ 'cede'];
                $ambiente .= "  ";
                $ambiente .= $fila[ 'nom_aula'];
                echo "<option values =' $ambiente'>  $ambiente </option>";
            }
            ?>
            </select>

            </td>

            <tr>

            <td><input type="submit" class="btn btn-primary btn-block" name="Enviar" value="Enviar"></td>
            <td></td>
</tr>

            
      
   

            </form>

            </table>
  
          
         
           
</body>
</html>
