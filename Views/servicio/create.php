<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ServicioController.php';

$controller = new ServicioController($conn);
$controller->crearServicio($_POST);
?>
