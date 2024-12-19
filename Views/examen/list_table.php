<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Exámenes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <section class="container my-5">
        <h1>Listado de Exámenes</h1>

        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/examen/form.php" class="btn btn-success">Crear Nuevo Examen</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Tipo</th>
                    <th>Fecha</th>
                    <th>Resultado</th>
                    <th>ID Mascota</th>
                    <th>ID Tratamiento</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($examenes)): ?>
                    <?php foreach ($examenes as $examen): ?>
                        <tr>
                            <td><?= htmlspecialchars($examen['ID_EXAMEN']) ?></td>
                            <td><?= htmlspecialchars($examen['TIPO']) ?></td>
                            <td><?= htmlspecialchars($examen['FECHA']) ?></td>
                            <td><?= htmlspecialchars($examen['RESULTADO']) ?></td>
                            <td><?= htmlspecialchars($examen['ID_MASCOTA']) ?></td>
                            <td><?= htmlspecialchars($examen['ID_TRATAMIENTO']) ?></td>
                            <td>
                                <a href="/DrVet/Views/examen/form.php?id=<?= $examen['ID_EXAMEN'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/examen/delete.php?id=<?= $examen['ID_EXAMEN'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este examen?');">Eliminar</a>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
