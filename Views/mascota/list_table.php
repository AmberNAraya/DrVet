<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Mascotas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<section class="container my-5">
    <h1>Listado de Mascotas</h1>
    <a href="/DrVet/Views/mascota/form.php" class="btn btn-success mb-3">Crear Nueva Mascota</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Especie</th>
                <th>Raza</th>
                <th>Edad</th>
                <th>ID Usuario</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($mascotas)): ?>
                <?php foreach ($mascotas as $mascota): ?>
                    <tr>
                        <td><?= htmlspecialchars($mascota['ID_MASCOTA']) ?></td>
                        <td><?= htmlspecialchars($mascota['NOMBRE']) ?></td>
                        <td><?= htmlspecialchars($mascota['ESPECIE']) ?></td>
                        <td><?= htmlspecialchars($mascota['RAZA']) ?></td>
                        <td><?= htmlspecialchars($mascota['EDAD']) ?></td>
                        <td><?= htmlspecialchars($mascota['ID_USUARIO']) ?></td>
                        <td>
                            <a href="/DrVet/Views/mascota/form.php?id=<?= $mascota['ID_MASCOTA'] ?>" class="btn btn-primary">Editar</a>
                            <a href="/DrVet/Views/mascota/delete.php?id=<?= $mascota['ID_MASCOTA'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar esta mascota?');">Eliminar</a>
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

</body>
</html>
