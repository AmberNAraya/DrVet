<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ClienteController.php';

$controller = new ClienteController($conn);
$controller->crearCliente($_POST);
?>