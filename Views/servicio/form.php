<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/ServicioController.php';

$controller = new ServicioController($conn);

$servicio = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $servicio = $controller->obtenerServicio($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($servicio) ? 'Editar' : 'Crear' ?> Servicio</title>
    <link rel="stylesheet" type="text/css" href="../../css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../fonts/icomoon.css">
    <link rel="stylesheet" type="text/css" href="../../css/vendor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../style.css">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
</head>

<body class="bg-accent-light">

    <section class="container my-5">
        <h1><?= isset($servicio) ? 'Editar' : 'Crear' ?> Servicio</h1>
        <form method="POST" action="<?= isset($servicio) ? '/DrVet/Views/servicio/update.php?id=' . $servicio['ID_SERVICIO'] : '/DrVet/Views/servicio/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" class="form-control" value="<?= isset($servicio) ? htmlspecialchars($servicio['NOMBRE']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <textarea name="descripcion" id="descripcion" class="form-control" rows="4" required><?= isset($servicio) ? htmlspecialchars($servicio['DESCRIPCION']) : '' ?></textarea>
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label">Precio:</label>
                <input type="number" name="precio" id="precio" class="form-control" step="0.01" value="<?= isset($servicio) ? htmlspecialchars($servicio['PRECIO']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_proveedor" class="form-label">ID Proveedor:</label>
                <input type="number" name="id_proveedor" id="id_proveedor" class="form-control" value="<?= isset($servicio) ? htmlspecialchars($servicio['ID_PROVEEDOR']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($servicio) ? 'Actualizar' : 'Crear' ?> Servicio</button>
        </form>
    </section>

    <footer id="footer" class="overflow-hidden">
        <div class="container mt-5">
            <div class="row">
                <div class="footer-top-area">
                    <div class="row d-flex flex-wrap justify-content-between">
                        <div class="col-lg-3 col-sm-6">
                            <div class="footer-menu menu-001">
                                <img src="../../images/main-logo.jpg" alt="logo">
                                <p>En Paws nuestra prioridad es que los animales se sientan en buenas manos.</p>
                                <div class="social-links">
                                    <ul class="d-flex list-unstyled">
                                        <li><a href="#"><i class="icon icon-facebook"></i></a></li>
                                        <li><a href="#"><i class="icon icon-instagram1"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="footer-menu contact-item menu-004">
                                <h5 class="widget-title">Contáctanos</h5>
                                <p>Tienes alguna sugerencia? <a href="mailto:sugerencias@paws.com">sugerencias@paws.com</a></p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="footer-menu contact-item menu-004">
                                <p>Si necesitas ayuda llámanos al: <a href="tel:22478877">2901-2288</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
    </footer>

    <script src="../../js/jquery-1.11.0.min.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
