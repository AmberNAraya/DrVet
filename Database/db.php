<?php

$username = 'Vete';
$password = 'admin'; 
$hostname = 'localhost:1521/orcl'; 

// Intentar la conexión
$conn = oci_connect($username, $password, $hostname);

if (!$conn) {
    $e = oci_error();
    echo "Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES);
    exit;
} else {
    echo "Conexión exitosa a la base de datos Paws!";
}

oci_close($conn);

?>
