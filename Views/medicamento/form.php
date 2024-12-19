<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/MedicamentoController.php';

$controller = new MedicamentoController($conn);

$medicamento = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $medicamento = $controller->obtenerMedicamento($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($medicamento) ? 'Editar' : 'Crear' ?> Medicamento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <section class="container my-5">
        <h1><?= isset($medicamento) ? 'Editar' : 'Crear' ?> Medicamento</h1>
        <form method="POST" action="<?= isset($medicamento) ? '/DrVet/Views/medicamento/update.php?id=' . $medicamento['ID_MEDICAMENTO'] : '/DrVet/Views/medicamento/create.php' ?>">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" class="form-control" value="<?= isset($medicamento) ? htmlspecialchars($medicamento['NOMBRE']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <textarea name="descripcion" id="descripcion" class="form-control" rows="4" required><?= isset($medicamento) ? htmlspecialchars($medicamento['DESCRIPCION']) : '' ?></textarea>
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label">Precio:</label>
                <input type="number" name="precio" id="precio" class="form-control" value="<?= isset($medicamento) ? htmlspecialchars($medicamento['PRECIO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="stock" class="form-label">Stock:</label>
                <input type="number" name="stock" id="stock" class="form-control" value="<?= isset($medicamento) ? htmlspecialchars($medicamento['STOCK']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="fecha_vencimiento" class="form-label">Fecha de Vencimiento:</label>
                <input type="date" name="fecha_vencimiento" id="fecha_vencimiento" class="form-control" value="<?= isset($medicamento) ? htmlspecialchars($medicamento['FECHA_VENCIMIENTO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_proveedor" class="form-label">ID Proveedor:</label>
                <input type="number" name="id_proveedor" id="id_proveedor" class="form-control" value="<?= isset($medicamento) ? htmlspecialchars($medicamento['ID_PROVEEDOR']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($medicamento) ? 'Actualizar' : 'Crear' ?> Medicamento</button>
        </form>
    </section>

</body>
</html>
