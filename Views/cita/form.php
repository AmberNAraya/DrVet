<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/CitaController.php';

$controller = new CitaController($conn);

$cita = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $cita = $controller->obtenerCita($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($cita) ? 'Editar' : 'Crear' ?> Cita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <section class="container my-5">
        <h1><?= isset($cita) ? 'Editar' : 'Crear' ?> Cita</h1>
        <form method="POST" action="<?= isset($cita) ? '/DrVet/Views/cita/update.php?id=' . $cita['ID_CITA'] : '/DrVet/Views/cita/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha:</label>
                <input type="date" name="fecha" id="fecha" class="form-control" value="<?= isset($cita) ? htmlspecialchars($cita['FECHA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="hora" class="form-label">Hora:</label>
                <input type="time" name="hora" id="hora" class="form-control" value="<?= isset($cita) ? htmlspecialchars($cita['HORA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="motivo" class="form-label">Motivo:</label>
                <input type="text" name="motivo" id="motivo" class="form-control" value="<?= isset($cita) ? htmlspecialchars($cita['MOTIVO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_mascota" class="form-label">ID Mascota:</label>
                <input type="number" name="id_mascota" id="id_mascota" class="form-control" value="<?= isset($cita) ? htmlspecialchars($cita['ID_MASCOTA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_usuario" class="form-label">ID Usuario:</label>
                <input type="number" name="id_usuario" id="id_usuario" class="form-control" value="<?= isset($cita) ? htmlspecialchars($cita['ID_USUARIO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="asistencia" class="form-label">Asistencia:</label>
                <input type="text" name="asistencia" id="asistencia" class="form-control" value="<?= isset($cita) ? htmlspecialchars($cita['ASISTENCIA']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($cita) ? 'Actualizar' : 'Crear' ?> Cita</button>
        </form>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
