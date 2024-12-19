<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Servicios</title>
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
        <h1>Listado de Servicios</h1>
        
        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/servicio/form.php" class="actions a create btn btn-success">Crear Nuevo Servicio</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Proveedor</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($servicios)): ?>
                    <?php foreach ($servicios as $servicio): ?>
                        <tr>
                            <td><?= htmlspecialchars($servicio['ID_SERVICIO']) ?></td>
                            <td><?= htmlspecialchars($servicio['NOMBRE']) ?></td>
                            <td><?= htmlspecialchars($servicio['DESCRIPCION']) ?></td>
                            <td><?= htmlspecialchars($servicio['PRECIO']) ?></td>
                            <td><?= htmlspecialchars($servicio['ID_PROVEEDOR']) ?></td>
                            <td class="actions">
                                <a href="/DrVet/Views/servicio/form.php?id=<?= $servicio['ID_SERVICIO'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/servicio/delete.php?id=<?= $servicio['ID_SERVICIO'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este servicio?');">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="6">No hay registros disponibles.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
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
