<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ProductoController.php';

$controller = new ProductoController($conn);
$id = $_GET['id'];
$controller->actualizarProducto($id, $_POST);
?>
