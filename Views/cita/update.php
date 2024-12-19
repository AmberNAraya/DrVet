<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/CitaController.php';

$controller = new CitaController($conn);
$id = $_GET['id'];
$controller->actualizarCita($id, $_POST);
?>
