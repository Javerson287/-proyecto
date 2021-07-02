<html>
<head>
<title>Validar si la contraseña y la repetición de la contraseña son iguales</title>
<script>
function comprobarClave(){
    clave1 = document.f1.clave1.value
    clave2 = document.f1.clave2.value

    if (clave1 == clave2)
       alert("Las dos claves son iguales...\nRealizaríamos las acciones del caso positivo")
    else
       alert("Las dos claves son distintas...\nRealizaríamos las acciones del caso negativo")
}
</script>
</head>

<body>

<h1>Validar si la contraseña y la repetición de la contraseña son iguales</h1>
<br>
Escribe una supuesta contraseña dos veces, una en cada campo, y pulsa el botón. Javascript te dirá si las dos son iguales.

<br>
<form action="" name="f1">
Contraseña: <input type="password" name="clave1" size="20">
<br>
Repite contraseña: <input type="password" name="clave2" size="20">
<br>
<input type="button" value="Comprobar si son iguales" onClick="comprobarClave()">

</form>

</body>
</html>