<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ProveedorController.php';

$controller = new ProveedorController($conn);

$proveedor = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $proveedor = $controller->obtenerProveedor($id);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($proveedor) ? 'Editar' : 'Crear' ?> Proveedor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <section class="container my-5">
        <h1><?= isset($proveedor) ? 'Editar' : 'Crear' ?> Proveedor</h1>
        <form method="POST" action="<?= isset($proveedor) ? '/DrVet/Views/proveedor/update.php?id=' . $proveedor['ID_PROVEEDOR'] : '/DrVet/Views/proveedor/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" class="form-control" value="<?= isset($proveedor) ? htmlspecialchars($proveedor['NOMBRE']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <input type="text" name="descripcion" id="descripcion" class="form-control" value="<?= isset($proveedor) ? htmlspecialchars($proveedor['DESCRIPCION']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="text" name="telefono" id="telefono" class="form-control" value="<?= isset($proveedor) ? htmlspecialchars($proveedor['TELEFONO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" name="email" id="email" class="form-control" value="<?= isset($proveedor) ? htmlspecialchars($proveedor['EMAIL']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($proveedor) ? 'Actualizar' : 'Crear' ?> Proveedor</button>
        </form>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
