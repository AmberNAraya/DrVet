<?php
require_once __DIR__ . '/../../db.php';  
require_once __DIR__ . '/../../Model/UsuarioModel.php';  

$data = [
    'nombre' => $_POST['nombre'],
    'apellido' => $_POST['apellido'],
    'telefono' => $_POST['telefono'],
    'email' => $_POST['email'],
    'rol' => isset($_POST['rol']) ? $_POST['rol'] : 'Usuario'
];

$modeloUsuario = new UsuarioModel($conn);

$modeloUsuario->insertarUsuario($data);
?>
