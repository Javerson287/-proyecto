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

<form action="r_programas.php" method= "POST">

<table >

<td><label for="imp"><h1>Agregar Programas</label></h1></td>
<td><input type="button" onclick="history.back()" class="btn btn-primary btn-block" name="volver atrás" value="volver"></td>
<tr>

<td><label for="imp"><h1>Ficha:</label></td></h1>
<td><input type="text" name="ficha" id="imp"></td></tr>
<tr>


<td><label for="imp"><h1>Nombre de programa:</label></td></h1>
<td><input type="text" name="nombre" id="imp"></td></tr>
<tr>


<td><label for="imp"><h1>instructor:</label></td></h1>
<td>

<select name="instructor">

        <?php
            //se realiza la conexion con la base de datos
            include('class/conexion.php');
            $conexion = conex::conectar();
            $sql = "select no_documento, nom_instructor from instructores";
            //echo $sql;
            $resultado = $conexion->query($sql);
            //se crea l alista de los ambientes
            while($fila = mysqli_fetch_array($resultado) )
            {
                $instructor = $fila[ 'no_documento'];
                $instructor .= "  ";
                $instructor .= $fila[ 'nom_instructor'];
                echo "<option values =' $instructor'>  $instructor </option>";
 }
            ?>
            </select>

            </td>
            
            <tr>
                                

        <td  style="margin: 0 auto;"><input type="submit" class="btn btn-primary btn-block" name="Enviar" value="Enviar"></td>
        <td></td>
        
    </tr>


            
      


        </form>

        </table>

      
     
       
</body>
</html>