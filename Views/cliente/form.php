<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ClienteController.php';

$controller = new ClienteController($conn);

$cliente = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $cliente = $controller->obtenerCliente($id);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($cliente) ? 'Editar' : 'Crear' ?> Cliente</title>
    <link rel="stylesheet" href="../../css/vendor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <section class="container my-5">
        <h1><?= isset($cliente) ? 'Editar' : 'Crear' ?> Cliente</h1>
        <form method="POST" action="<?= isset($cliente) ? '/DrVet/Views/cliente/update.php?id=' . $cliente['ID_CLIENTE'] : '/DrVet/Views/cliente/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" class="form-control" value="<?= isset($cliente) ? htmlspecialchars($cliente['NOMBRE']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido:</label>
                <input type="text" name="apellido" id="apellido" class="form-control" value="<?= isset($cliente) ? htmlspecialchars($cliente['APELLIDO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección:</label>
                <input type="text" name="direccion" id="direccion" class="form-control" value="<?= isset($cliente) ? htmlspecialchars($cliente['DIRECCION']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="text" name="telefono" id="telefono" class="form-control" value="<?= isset($cliente) ? htmlspecialchars($cliente['TELEFONO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico:</label>
                <input type="email" name="email" id="email" class="form-control" value="<?= isset($cliente) ? htmlspecialchars($cliente['EMAIL']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($cliente) ? 'Actualizar' : 'Crear' ?> Cliente</button>
        </form>
    </section>
</body>
</html>
