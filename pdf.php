<?php
require_once('fpdf.php');

class PDF extends FPDF
{
    // Cabecera de página
    function Header()
    {
        // Logo
        $this->Image('img/sena.png',10,8,33);
        // Arial bold 15
        $this->SetFont('Arial','B',15);
        // Movernos a la derecha
        $this->Cell(120);
        // Título
        $this->Cell(30,10,'Informe de prestamo de ambientes',0,1,'C');
        // Salto de línea
        $this->Ln(20);
    }

    // Pie de página
    function Footer()
    {
        // Posición: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial','I',8);
        // Número de página
        $this->Cell(0,10,'Pagina '.$this->PageNo().'/{nb}',0,0,'C');
    }
}




$buscar = isset( $_GET['id']) ? $_GET['id'] : ""; 

$conn = mysqli_connect( "localhost", "root", "", "proyecto" );
$consulta = "SELECT * FROM prestamo_ambientes WHERE cede like '%".$buscar."%'
OR hora_ingreso LIKE'%".$buscar."%' OR fecha_registro LIKE'%".$buscar."%' ";

$resultado = $conn->query($consulta);
//echo $consulta;
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial','B',10);

$pdf->Ln(000);


$pdf->setfont('Arial','B',8);
$pdf->cell(31,8,'fecha_registro',1,0,'c',0);
    $pdf->cell(20,8,'cede',1,0,'c',0);
    $pdf->cell(20,8,'hora_ingreso',1,0,'c',0);
    $pdf->cell(20,8,'hora_salida',1,0,'c',0);
    $pdf->cell(8,8,'No',1,0,'c',0);
    $pdf->cell(8,8,'Id',1,0,'c',0);
    $pdf->cell(30,8,'fecha_prestamo',1,0,'c',0);
    $pdf->cell(30,8,'fecha_devolucion',1,0,'c',0);
    $pdf->multicell(115,8,'observaciones',1,'c',0);

while($row = $resultado->fetch_assoc()){
    $pdf->cell(31,8,$row['fecha_registro'],1,0,'c',0);
    $pdf->cell(20,8,utf8_decode($row['cede']),1,0,'c',0);
    $pdf->cell(20,8,$row['hora_ingreso'],1,0,'c',0);
    $pdf->cell(20,8,$row['hora_salida'],1,0,'c',0);
    $pdf->cell(8,8,$row['no'],1,0,'c',0);
    $pdf->cell(8,8,$row['id'],1,0,'c',0);
    $pdf->cell(30,8,$row['fecha_prestamo'],1,0,'c',0);
    $pdf->cell(30,8,$row['fecha_devolucion'],1,0,'c',0);
    $pdf->multicell(115,8,utf8_decode($row['observaciones']),1,'c',0);
}


 $pdf->output()
?>
