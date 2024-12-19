<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ExamenController.php';

$controller = new ExamenController($conn);

$examen = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $examen = $controller->obtenerExamen($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($examen) ? 'Editar' : 'Crear' ?> Examen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <section class="container my-5">
        <h1><?= isset($examen) ? 'Editar' : 'Crear' ?> Examen</h1>
        <form method="POST" action="<?= isset($examen) ? '/DrVet/Views/examen/update.php?id=' . $examen['ID_EXAMEN'] : '/DrVet/Views/examen/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="tipo" class="form-label">Tipo:</label>
                <input type="text" name="tipo" id="tipo" class="form-control" value="<?= isset($examen) ? htmlspecialchars($examen['TIPO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha:</label>
                <input type="date" name="fecha" id="fecha" class="form-control" value="<?= isset($examen) ? htmlspecialchars($examen['FECHA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="resultado" class="form-label">Resultado:</label>
                <textarea name="resultado" id="resultado" class="form-control" rows="4" required><?= isset($examen) ? htmlspecialchars($examen['RESULTADO']) : '' ?></textarea>
            </div>
            <div class="mb-3">
                <label for="id_mascota" class="form-label">ID Mascota:</label>
                <input type="number" name="id_mascota" id="id_mascota" class="form-control" value="<?= isset($examen) ? htmlspecialchars($examen['ID_MASCOTA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_tratamiento" class="form-label">ID Tratamiento:</label>
                <input type="number" name="id_tratamiento" id="id_tratamiento" class="form-control" value="<?= isset($examen) ? htmlspecialchars($examen['ID_TRATAMIENTO']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($examen) ? 'Actualizar' : 'Crear' ?> Examen</button>
        </form>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
