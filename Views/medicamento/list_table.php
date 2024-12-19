<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicamentos</title>
    <link rel="stylesheet" type="text/css" href="../../css/normalize.css">
    <link rel="stylesheet" href="../../css/vendor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../style.css">
</head>

<body>

    <section class="container my-5">
        <h1>Listado de Medicamentos</h1>

        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/medicamento/form.php" class="btn btn-success">Crear Nuevo Medicamento</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Fecha Vencimiento</th>
                    <th>Proveedor</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($medicamentos)): ?>
                    <?php foreach ($medicamentos as $medicamento): ?>
                        <tr>
                            <td><?= htmlspecialchars($medicamento['ID_MEDICAMENTO']) ?></td>
                            <td><?= htmlspecialchars($medicamento['NOMBRE']) ?></td>
                            <td><?= htmlspecialchars($medicamento['DESCRIPCION']) ?></td>
                            <td><?= htmlspecialchars($medicamento['PRECIO']) ?></td>
                            <td><?= htmlspecialchars($medicamento['STOCK']) ?></td>
                            <td><?= htmlspecialchars($medicamento['FECHA_VENCIMIENTO']) ?></td>
                            <td><?= htmlspecialchars($medicamento['ID_PROVEEDOR']) ?></td>
                            <td>
                                <a href="/DrVet/Views/medicamento/form.php?id=<?= $medicamento['ID_MEDICAMENTO'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/medicamento/delete.php?id=<?= $medicamento['ID_MEDICAMENTO'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este medicamento?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="8">No hay registros disponibles.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>

</body>
</html>
