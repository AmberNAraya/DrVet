<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/MedicamentoController.php';

$controller = new MedicamentoController($conn);
$id = $_GET['id'];
$controller->actualizarMedicamento($id, $_POST);
?>
