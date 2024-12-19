<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/MascotaController.php';

$controller = new MascotaController($conn);

$mascota = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $mascota = $controller->obtenerMascota($id);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($mascota) ? 'Editar' : 'Crear' ?> Mascota</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<section class="container my-5">
    <h1><?= isset($mascota) ? 'Editar' : 'Crear' ?> Mascota</h1>
    <form method="POST" action="<?= isset($mascota) ? '/DrVet/Views/mascota/update.php?id=' . $mascota['ID_MASCOTA'] : '/DrVet/Views/mascota/create.php' ?>" class="form-group">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre:</label>
            <input type="text" name="nombre" id="nombre" class="form-control" value="<?= isset($mascota) ? htmlspecialchars($mascota['NOMBRE']) : '' ?>" required>
        </div>
        <div class="mb-3">
            <label for="especie" class="form-label">Especie:</label>
            <input type="text" name="especie" id="especie" class="form-control" value="<?= isset($mascota) ? htmlspecialchars($mascota['ESPECIE']) : '' ?>" required>
        </div>
        <div class="mb-3">
            <label for="raza" class="form-label">Raza:</label>
            <input type="text" name="raza" id="raza" class="form-control" value="<?= isset($mascota) ? htmlspecialchars($mascota['RAZA']) : '' ?>" required>
        </div>
        <div class="mb-3">
            <label for="edad" class="form-label">Edad:</label>
            <input type="number" name="edad" id="edad" class="form-control" value="<?= isset($mascota) ? htmlspecialchars($mascota['EDAD']) : '' ?>" required>
        </div>
        <div class="mb-3">
            <label for="id_usuario" class="form-label">ID Usuario:</label>
            <input type="number" name="id_usuario" id="id_usuario" class="form-control" value="<?= isset($mascota) ? htmlspecialchars($mascota['ID_USUARIO']) : '' ?>" required>
        </div>
        <button type="submit" class="btn btn-primary"><?= isset($mascota) ? 'Actualizar' : 'Crear' ?> Mascota</button>
    </form>
</section>

</body>
</html>
