<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/UsuarioController.php';

$controller = new UsuarioController($conn);

$usuario = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $usuario = $controller->obtenerUsuario($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($usuario) ? 'Editar' : 'Crear' ?> Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <section class="container my-5">
        <h1><?= isset($usuario) ? 'Editar' : 'Crear' ?> Usuario</h1>
        <form method="POST" action="<?= isset($usuario) ? '/DrVet/Views/usuario/update.php?id=' . $usuario['ID_USUARIO'] : '/DrVet/Views/usuario/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" class="form-control" value="<?= isset($usuario) ? htmlspecialchars($usuario['NOMBRE']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido:</label>
                <input type="text" name="apellido" id="apellido" class="form-control" value="<?= isset($usuario) ? htmlspecialchars($usuario['APELLIDO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="text" name="telefono" id="telefono" class="form-control" value="<?= isset($usuario) ? htmlspecialchars($usuario['TELEFONO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" name="email" id="email" class="form-control" value="<?= isset($usuario) ? htmlspecialchars($usuario['EMAIL']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="rol" class="form-label">Rol:</label>
                <input type="text" name="rol" id="rol" class="form-control" value="<?= isset($usuario) ? htmlspecialchars($usuario['ROL']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($usuario) ? 'Actualizar' : 'Crear' ?> Usuario</button>
        </form>
    </section>

</body>
</html>
