<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial Médico</title>
    <!-- Rutas Corregidas para el Nuevo Directorio -->
    <link rel="stylesheet" type="text/css" href="../../css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../fonts/icomoon.css">
    <link rel="stylesheet" type="text/css" href="../../css/vendor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../style.css">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
</head>

<body class="bg-accent-light">
    <!-- Header -->
    <header id="header" class="content-light">
        <div class="header-wrap container py-3">
            <div class="row align-items-center">
                <div class="primary-nav col-md-5 col-sm-2">
                    <nav class="navbar">
                        <div class="main-menu">
                            <ul class="menu-list list-unstyled d-flex m-0">
                                <li class="menu-itemhome1 dropdown">
                                    <a class="text-uppercase item-anchor dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                       aria-expanded="false">Citas</a>
                                    <ul class="dropdown-menu">
                                        <li class="sub-page pe-0"><a class="text-black text-uppercase dropdown-item" href="../../index.php">Sacar cita para mi mascota</a></li>
                                        <li class="sub-page pe-0"><a class="text-black text-uppercase dropdown-item" href="../../index.php">Historial Médico de mi mascota</a></li>
                                    </ul>
                                </li>
                                <li class="menu-itemhome2">
                                    <a href="./Ubicacion.php" class="text-uppercase item-anchor">Nuestros servicios</a>
                                </li>
                                <li class="menu-itemhome3">
                                    <a href="../../about-us.html" class="text-uppercase item-anchor">Productos</a>
                                </li>
                                <li class="menu-itemhome4">
                                    <a href="./Ubicacion.php" class="text-uppercase item-anchor">Ubicación de la clínica</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="col-md-2 col-sm-4 brand-block text-center">
                    <div class="main-logo">
                        <a href="../../index.php">
                            <img src="../../images/main-logo.jpg" alt="logo" class="brand-image">
                        </a>
                    </div>
                </div>
                <div class="right-block col-md-5 col-sm-4">
                    <nav class="navbar justify-content-end">
                        <div class="user-items">
                            <ul class="list-unstyled content-light d-flex align-items-center m-0">
                                <li>
                                    <i class="icon icon-user"></i>
                                    <a href="../../my-account.html" class="text-uppercase item-anchor">Iniciar Sesión</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <!-- Banner Principal -->
    <section id="billboard" class="padding-large no-padding-top position-relative">
        <div class="image-holder">
            <img src="../../images/banner-image.jpg" alt="banner" class="banner-image">
        </div>
        <div class="banner-content content-light style1 text-center col-md-6">
            <h2 class="banner-title">Historial Médico de las Mascotas</h2>
        </div>
    </section>

    <!-- Listado de Historiales Médicos -->
    <section class="container my-5">
        <h1>Listado de Historiales Médicos</h1>
        
        <div style="margin-bottom: 10px;">
            <a href="/DrVet/Views/historial_medico/form.php" class="actions a create btn btn-success">Crear Nuevo Historial</a>
        </div>

        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Fecha</th>
                    <th>ID Mascota</th>
                    <th>ID Usuario</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($historiales)): ?>
                    <?php foreach ($historiales as $historial): ?>
                        <tr>
                            <td><?= htmlspecialchars($historial['ID_HISTORIAL']) ?></td>
                            <td><?= htmlspecialchars($historial['DESCRIPCION']) ?></td>
                            <td><?= htmlspecialchars($historial['FECHA']) ?></td>
                            <td><?= htmlspecialchars($historial['ID_MASCOTA']) ?></td>
                            <td><?= htmlspecialchars($historial['ID_USUARIO']) ?></td>
                            <td class="actions">
                                <a href="/DrVet/Views/historial_medico/form.php?id=<?= $historial['ID_HISTORIAL'] ?>" class="btn btn-primary">Editar</a>
                                <a href="/DrVet/Views/historial_medico/delete.php?id=<?= $historial['ID_HISTORIAL'] ?>" class="btn btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar este historial?');">Eliminar</a>
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

    <!-- Footer -->
    <footer id="footer" class="overflow-hidden">
        <div class="container mt-5">
            <div class="row">
                <div class="footer-top-area">
                    <div class="row d-flex flex-wrap justify-content-between">
                        <!-- Columna de Logo y Descripción -->
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
                        <!-- Contáctanos Section -->
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

    <!-- Scripts -->
    <script src="../../js/jquery-1.11.0.min.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
