<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ProductoController.php';

$controller = new ProductoController($conn);

$producto = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $producto = $controller->obtenerProducto($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($producto) ? 'Editar' : 'Crear' ?> Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <section class="container my-5">
        <h1><?= isset($producto) ? 'Editar' : 'Crear' ?> Producto</h1>
        <form method="POST" action="<?= isset($producto) ? '/DrVet/Views/producto/update.php?id=' . $producto['ID_PRODUCTO'] : '/DrVet/Views/producto/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" class="form-control" value="<?= isset($producto) ? htmlspecialchars($producto['NOMBRE']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <input type="text" name="descripcion" id="descripcion" class="form-control" value="<?= isset($producto) ? htmlspecialchars($producto['DESCRIPCION']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="stock" class="form-label">Stock:</label>
                <input type="number" name="stock" id="stock" class="form-control" value="<?= isset($producto) ? htmlspecialchars($producto['STOCK']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label">Precio:</label>
                <input type="number" name="precio" id="precio" class="form-control" value="<?= isset($producto) ? htmlspecialchars($producto['PRECIO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_proveedor" class="form-label">ID Proveedor:</label>
                <input type="number" name="id_proveedor" id="id_proveedor" class="form-control" value="<?= isset($producto) ? htmlspecialchars($producto['ID_PROVEEDOR']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($producto) ? 'Actualizar' : 'Crear' ?> Producto</button>
        </form>
    </section>
</body>

</html>
