<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ExamenController.php';

$controller = new ExamenController($conn);
$id = $_GET['id'];
$controller->actualizarExamen($id, $_POST);
?>
