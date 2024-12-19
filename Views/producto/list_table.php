<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Productos</title>
    <link rel="stylesheet" href="../../css/normalize.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <section class="container my-5">
        <h1>Listado de Productos</h1>
        
        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/producto/form.php" class="btn btn-success">Crear Nuevo Producto</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Stock</th>
                    <th>Precio</th>
                    <th>ID Proveedor</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($productos)): ?>
                    <?php foreach ($productos as $producto): ?>
                        <tr>
                            <td><?= htmlspecialchars($producto['ID_PRODUCTO']) ?></td>
                            <td><?= htmlspecialchars($producto['NOMBRE']) ?></td>
                            <td><?= htmlspecialchars($producto['DESCRIPCION']) ?></td>
                            <td><?= htmlspecialchars($producto['STOCK']) ?></td>
                            <td><?= htmlspecialchars($producto['PRECIO']) ?></td>
                            <td><?= htmlspecialchars($producto['ID_PROVEEDOR']) ?></td>
                            <td>
                                <a href="/DrVet/Views/producto/form.php?id=<?= $producto['ID_PRODUCTO'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/producto/delete.php?id=<?= $producto['ID_PRODUCTO'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="7">No hay registros disponibles.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>

    <script src="../../js/jquery-1.11.0.min.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
