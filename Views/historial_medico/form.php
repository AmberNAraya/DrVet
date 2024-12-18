<?php
require_once __DIR__ . '/../../db.php';
require_once __DIR__ . '/../../Controller/HistorialMedicoController.php';

$controller = new HistorialMedicoController($conn);

$historial = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $historial = $controller->obtenerHistorial($id);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= isset($historial) ? 'Editar' : 'Crear' ?> Historial Médico</title>
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
        <h1><?= isset($historial) ? 'Editar' : 'Crear' ?> Historial Médico</h1>
        <form method="POST" action="<?= isset($historial) ? '/DrVet/Views/historial_medico/update.php?id=' . $historial['ID_HISTORIAL'] : '/DrVet/Views/historial_medico/create.php' ?>" class="form-group">
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <textarea name="descripcion" id="descripcion" class="form-control" rows="4" required><?= isset($historial) ? htmlspecialchars($historial['DESCRIPCION']) : '' ?></textarea>
            </div>
            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha:</label>
                <input type="date" name="fecha" id="fecha" class="form-control" value="<?= isset($historial) ? htmlspecialchars($historial['FECHA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_mascota" class="form-label">ID Mascota:</label>
                <input type="number" name="id_mascota" id="id_mascota" class="form-control" value="<?= isset($historial) ? htmlspecialchars($historial['ID_MASCOTA']) : '' ?>" required>
            </div>
            <div class="mb-3">
                <label for="id_usuario" class="form-label">ID Usuario:</label>
                <input type="number" name="id_usuario" id="id_usuario" class="form-control" value="<?= isset($historial) ? htmlspecialchars($historial['ID_USUARIO']) : '' ?>" required>
            </div>
            <button type="submit" class="btn btn-primary"><?= isset($historial) ? 'Actualizar' : 'Crear' ?> Historial</button>
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
