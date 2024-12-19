<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Tratamientos</title>
    <link rel="stylesheet" type="text/css" href="../../css/normalize.css">
    <link rel="stylesheet" href="../../fonts/icomoon.css">
    <link rel="stylesheet" href="../../css/vendor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../style.css">
</head>

<body>

    <section class="container my-5">
        <h1>Listado de Tratamientos</h1>
        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/tratamiento/form.php" class="btn btn-success">Crear Nuevo Tratamiento</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Medicina</th>
                    <th>Duración</th>
                    <th>ID Historial</th>
                    <th>ID Producto</th>
                    <th>ID Usuario</th>
                    <th>ID Veterinario</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($tratamientos)): ?>
                    <?php foreach ($tratamientos as $tratamiento): ?>
                        <tr>
                            <td><?= htmlspecialchars($tratamiento['ID_TRATAMIENTO']) ?></td>
                            <td><?= htmlspecialchars($tratamiento['DESCRIPCION']) ?></td>
                            <td><?= htmlspecialchars($tratamiento['MEDICINA']) ?></td>
                            <td><?= htmlspecialchars($tratamiento['DURACION']) ?></td>
                            <td><?= htmlspecialchars($tratamiento['ID_HISTORIAL']) ?></td>
                            <td><?= htmlspecialchars($tratamiento['ID_PRODUCTO']) ?></td>
                            <td><?= htmlspecialchars($tratamiento['ID_USUARIO']) ?></td>
                            <td><?= htmlspecialchars($tratamiento['ID_VETERINARIO']) ?></td>
                            <td>
                                <a href="/DrVet/Views/tratamiento/form.php?id=<?= $tratamiento['ID_TRATAMIENTO'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/tratamiento/delete.php?id=<?= $tratamiento['ID_TRATAMIENTO'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este tratamiento?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="9">No hay registros disponibles.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>

</body>
</html>
