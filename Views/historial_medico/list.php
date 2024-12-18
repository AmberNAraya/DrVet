<?php
require_once __DIR__ . '/../../db.php'; 
require_once __DIR__ . '/../../Controller/HistorialMedicoController.php'; 

$controller = new HistorialMedicoController($conn);

$controller->listarHistoriales();
?>
