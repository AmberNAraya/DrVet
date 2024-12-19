<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ProductoController.php';

$controller = new ProductoController($conn);
$controller->crearProducto($_POST);
?>
