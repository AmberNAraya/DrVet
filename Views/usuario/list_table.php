<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <section class="container my-5">
        <h1>Listado de Usuarios</h1>
        
        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/usuario/form.php" class="btn btn-success">Crear Nuevo Usuario</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Rol</th>
                    <th>Fecha de Creación</th>
                    <th>Fecha de Actualización</th>
                    <th>Fecha Fin</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($usuarios)): ?>
                    <?php foreach ($usuarios as $usuario): ?>
                        <tr>
                            <td><?= htmlspecialchars($usuario['ID_USUARIO']) ?></td>
                            <td><?= htmlspecialchars($usuario['NOMBRE']) ?></td>
                            <td><?= htmlspecialchars($usuario['APELLIDO']) ?></td>
                            <td><?= htmlspecialchars($usuario['TELEFONO']) ?></td>
                            <td><?= htmlspecialchars($usuario['EMAIL']) ?></td>
                            <td><?= htmlspecialchars($usuario['ROL']) ?></td>
                            <td><?= htmlspecialchars($usuario['FECHA_CREACION']) ?></td>
                            <td><?= htmlspecialchars($usuario['FECHA_ACTUALIZACION']) ?></td>
                            <td><?= htmlspecialchars($usuario['FECHA_FIN']) ?></td>
                            <td>
                                <a href="/DrVet/Views/usuario/form.php?id=<?= $usuario['ID_USUARIO'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/usuario/delete.php?id=<?= $usuario['ID_USUARIO'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="10">No hay registros disponibles.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </section>

</body>
</html>
