<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Citas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <section class="container my-5">
        <h1>Listado de Citas</h1>

        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/cita/form.php" class="btn btn-success">Crear Nueva Cita</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Motivo</th>
                    <th>ID Mascota</th>
                    <th>ID Usuario</th>
                    <th>Asistencia</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($citas)): ?>
                    <?php foreach ($citas as $cita): ?>
                        <tr>
                            <td><?= htmlspecialchars($cita['ID_CITA']) ?></td>
                            <td><?= htmlspecialchars($cita['FECHA']) ?></td>
                            <td><?= htmlspecialchars($cita['HORA']) ?></td>
                            <td><?= htmlspecialchars($cita['MOTIVO']) ?></td>
                            <td><?= htmlspecialchars($cita['ID_MASCOTA']) ?></td>
                            <td><?= htmlspecialchars($cita['ID_USUARIO']) ?></td>
                            <td><?= htmlspecialchars($cita['ASISTENCIA']) ?></td>
                            <td>
                                <a href="/DrVet/Views/cita/form.php?id=<?= $cita['ID_CITA'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/cita/delete.php?id=<?= $cita['ID_CITA'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar esta cita?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="8">No hay citas registradas.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
