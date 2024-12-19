<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/MascotaController.php';

$controller = new MascotaController($conn);
$id = $_GET['id'];
$controller->actualizarMascota($id, $_POST);
?>
