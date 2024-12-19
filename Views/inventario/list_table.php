<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Inventarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <section class="container my-5">
        <h1>Listado de Inventarios</h1>
        
        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/inventario/form.php" class="btn btn-success">Crear Nuevo Inventario</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>ID Producto</th>
                    <th>Cantidad</th>
                    <th>Fecha de Actualización</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($inventarios)): ?>
                    <?php foreach ($inventarios as $inventario): ?>
                        <tr>
                            <td><?= htmlspecialchars($inventario['ID_INVENTARIO']) ?></td>
                            <td><?= htmlspecialchars($inventario['ID_PRODUCTO']) ?></td>
                            <td><?= htmlspecialchars($inventario['CANTIDAD']) ?></td>
                            <td><?= htmlspecialchars($inventario['FECHA_ACTUALIZACION']) ?></td>
                            <td>
                                <a href="/DrVet/Views/inventario/form.php?id=<?= $inventario['ID_INVENTARIO'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/inventario/delete.php?id=<?= $inventario['ID_INVENTARIO'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este inventario?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="5">No hay registros disponibles.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>

</body>
</html>
