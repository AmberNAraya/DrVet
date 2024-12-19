<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/TratamientoController.php';

$controller = new TratamientoController($conn);

$tratamiento = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $tratamiento = $controller->obtenerTratamiento($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($tratamiento) ? 'Editar' : 'Crear' ?> Tratamiento</title>
    <link rel="stylesheet" type="text/css" href="../../css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../fonts/icomoon.css">
    <link rel="stylesheet" type="text/css" href="../../css/vendor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../style.css">
</head>

<body>

    <section class="container my-5">
        <h1><?= isset($tratamiento) ? 'Editar' : 'Crear' ?> Tratamiento</h1>
        <form method="POST" action="<?= isset($tratamiento) ? '/DrVet/Views/tratamiento/update.php?id=' . $tratamiento['ID_TRATAMIENTO'] : '/DrVet/Views/tratamiento/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <input type="text" name="descripcion" id="descripcion" class="form-control" value="<?= isset($tratamiento) ? htmlspecialchars($tratamiento['DESCRIPCION']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="medicina" class="form-label">Medicina:</label>
                <input type="text" name="medicina" id="medicina" class="form-control" value="<?= isset($tratamiento) ? htmlspecialchars($tratamiento['MEDICINA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="duracion" class="form-label">Duración:</label>
                <input type="number" name="duracion" id="duracion" class="form-control" value="<?= isset($tratamiento) ? htmlspecialchars($tratamiento['DURACION']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_historial" class="form-label">ID Historial:</label>
                <input type="number" name="id_historial" id="id_historial" class="form-control" value="<?= isset($tratamiento) ? htmlspecialchars($tratamiento['ID_HISTORIAL']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_producto" class="form-label">ID Producto:</label>
                <input type="number" name="id_producto" id="id_producto" class="form-control" value="<?= isset($tratamiento) ? htmlspecialchars($tratamiento['ID_PRODUCTO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_usuario" class="form-label">ID Usuario:</label>
                <input type="number" name="id_usuario" id="id_usuario" class="form-control" value="<?= isset($tratamiento) ? htmlspecialchars($tratamiento['ID_USUARIO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_veterinario" class="form-label">ID Veterinario:</label>
                <input type="number" name="id_veterinario" id="id_veterinario" class="form-control" value="<?= isset($tratamiento) ? htmlspecialchars($tratamiento['ID_VETERINARIO']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($tratamiento) ? 'Actualizar' : 'Crear' ?> Tratamiento</button>
        </form>
    </section>

</body>
</html>
