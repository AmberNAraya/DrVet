<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ExamenController.php';

$controller = new ExamenController($conn);
$controller->crearExamen($_POST);
?>
