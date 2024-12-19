<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ProveedorController.php';

$controller = new ProveedorController($conn);
$controller->crearProveedor($_POST);
?>
