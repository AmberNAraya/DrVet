<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/InventarioController.php';

$controller = new InventarioController($conn);
$controller->crearInventario($_POST);
?>
