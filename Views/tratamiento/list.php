<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/TratamientoController.php';

$controller = new TratamientoController($conn);

$controller->listarTratamientos();
?>
