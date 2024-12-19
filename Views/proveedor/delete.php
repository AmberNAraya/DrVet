<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ProveedorController.php';

$controller = new ProveedorController($conn);
$id = $_GET['id'];
$controller->eliminarProveedor($id);
?>
