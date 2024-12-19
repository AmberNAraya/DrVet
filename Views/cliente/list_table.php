<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../style.css">
</head>
<body class="bg-accent-light">
    <section class="container my-5">
        <h1>Listado de Clientes</h1>
        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/cliente/form.php" class="btn btn-success">Crear Nuevo Cliente</a>
        </div>
        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($clientes)): ?>
                    <?php foreach ($clientes as $cliente): ?>
                        <tr>
                            <td><?= htmlspecialchars($cliente['ID_CLIENTE']) ?></td>
                            <td><?= htmlspecialchars($cliente['NOMBRE']) ?></td>
                            <td><?= htmlspecialchars($cliente['APELLIDO']) ?></td>
                            <td><?= htmlspecialchars($cliente['DIRECCION']) ?></td>
                            <td><?= htmlspecialchars($cliente['TELEFONO']) ?></td>
                            <td><?= htmlspecialchars($cliente['EMAIL']) ?></td>
                            <td class="actions">
                                <a href="/DrVet/Views/cliente/form.php?id=<?= $cliente['ID_CLIENTE'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/cliente/delete.php?id=<?= $cliente['ID_CLIENTE'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este cliente?');">Eliminar</a>
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
