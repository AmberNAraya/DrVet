<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/InventarioController.php';

$controller = new InventarioController($conn);

$inventario = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $inventario = $controller->obtenerInventario($id);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($inventario) ? 'Editar' : 'Crear' ?> Inventario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <section class="container my-5">
        <h1><?= isset($inventario) ? 'Editar' : 'Crear' ?> Inventario</h1>
        <form method="POST" action="<?= isset($inventario) ? '/DrVet/Views/inventario/update.php?id=' . $inventario['ID_INVENTARIO'] : '/DrVet/Views/inventario/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="id_producto" class="form-label">ID Producto:</label>
                <input type="number" name="id_producto" id="id_producto" class="form-control" value="<?= isset($inventario) ? htmlspecialchars($inventario['ID_PRODUCTO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="cantidad" class="form-label">Cantidad:</label>
                <input type="number" name="cantidad" id="cantidad" class="form-control" value="<?= isset($inventario) ? htmlspecialchars($inventario['CANTIDAD']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($inventario) ? 'Actualizar' : 'Crear' ?> Inventario</button>
        </form>
    </section>

</body>
</html>
