<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Proveedores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <section class="container my-5">
        <h1>Listado de Proveedores</h1>

        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/proveedor/form.php" class="btn btn-success">Crear Nuevo Proveedor</a>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($proveedores)): ?>
                    <?php foreach ($proveedores as $proveedor): ?>
                        <tr>
                            <td><?= htmlspecialchars($proveedor['ID_PROVEEDOR']) ?></td>
                            <td><?= htmlspecialchars($proveedor['NOMBRE']) ?></td>
                            <td><?= htmlspecialchars($proveedor['DESCRIPCION']) ?></td>
                            <td><?= htmlspecialchars($proveedor['TELEFONO']) ?></td>
                            <td><?= htmlspecialchars($proveedor['EMAIL']) ?></td>
                            <td>
                                <a href="/DrVet/Views/proveedor/form.php?id=<?= $proveedor['ID_PROVEEDOR'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/proveedor/delete.php?id=<?= $proveedor['ID_PROVEEDOR'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este proveedor?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="6">No hay registros disponibles.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
