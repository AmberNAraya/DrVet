<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/UsuarioController.php';

$controller = new UsuarioController($conn);
$id = $_GET['id'];
$controller->actualizarUsuario($id, $_POST);
?>
