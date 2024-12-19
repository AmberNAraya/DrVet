<?php
require_once __DIR__ . '/../../db.php'; 
require_once __DIR__ . '/../../Controller/MedicamentoController.php'; 

$controller = new MedicamentoController($conn);

$controller->listarMedicamentos();
?>
