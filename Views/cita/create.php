<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/CitaController.php';

$controller = new CitaController($conn);
$controller->crearCita($_POST);
?>
