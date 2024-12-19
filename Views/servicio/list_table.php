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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body class="homepage bg-light">
  <!-- Header -->
  <header id="header" class="bg-white text-dark py-3 shadow">
    <div class="container">
      <div class="d-flex justify-content-between align-items-center">
        <!-- Logo -->
        <a href="../../index.php" class="navbar-brand text-dark d-flex align-items-center">
          <img src="../../img/perro-tejonero.png" alt="Logo" class="logo me-2" width="50">
          <span>DrPet</span>
        </a>
        <nav class="navbar">
          <ul class="nav">
            <li class="nav-item"><a href="../../Views/cliente/list.php" class="nav-link text-dark">Cliente</a></li>
            <li class="nav-item"><a href="../../Views/servicio/list.php" class="nav-link text-dark">Servicio</a></li>
            
            <!-- Dropdown for Productos -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Productos
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="../../Views/inventario/list.php">Inventario</a></li>
                <li><a class="dropdown-item" href="../../Views/producto/list.php">Producto</a></li>
                <li><a class="dropdown-item" href="../../Views/proveedor/list.php">Proveedor</a></li>
                <li><a class="dropdown-item" href="../../Views/medicamento/list.php">Medicamento</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-dark" href="Views/inventario/list.php" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Mascota
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="../../Views/examen/list.php">Examenes</a></li>
                <li><a class="dropdown-item" href="../../Views/historial_medico/list.php">Historial Medico</a></li>
                <li><a class="dropdown-item" href="../../Views/tratamiento/list.php">Tratamiento</a></li>
              </ul>
            </li>
          </ul>
          
          <!-- Profile Image as Link -->
          <a href="../../views/usuario/list.php">
            <img src="../../img/usuario.png" alt="Imagen de Usuario" class="rounded-circle" width="28" height="28">
          </a>
        </nav>
      </div>
    </div>
  </header>

  <section class="container my-5">
  <div class="p-4 shadow-sm" style="background-color: #ADB8B2; border-radius: 15px;">
    <!-- Título -->
    <h1 class="text-center mb-4" style="color:rgb(42, 42, 42); font-weight: bold;">Listado de Servicios</h1>
    
    <!-- Botón Crear Nuevo Servicio -->
    <div class="text-end mb-3">
      <a href="/DrVet/Views/servicio/form.php" class="btn btn-success" style="background-color: #869B8F; border-color:rgb(255, 255, 255); color: #fff;">Crear Nuevo Servicio</a>
    </div>

    <!-- Tabla -->
    <table class="table table-bordered table-hover text-center" style="background-color:rgb(255, 255, 255);">
      <thead class="table-light" style="background-color:rgb(255, 255, 255); color:rgb(35, 35, 35);">
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
              <td>
                <a href="/DrVet/Views/servicio/form.php?id=<?= $servicio['ID_SERVICIO'] ?>" class="btn btn-primary btn-sm">Editar</a>
                <a href="/DrVet/Views/servicio/delete.php?id=<?= $servicio['ID_SERVICIO'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este servicio?');">Eliminar</a>
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
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>


<br>
<br>
<br>
<br>
<!-- Footer -->
<hr style="border-top: 2px solid #fff;">
<footer id="footer" class="bg-light" style="padding: 10px 0;">
  <div class="container text-center">
    <p>&copy; 2024 DrPet. <br> Todos los derechos reservados.</p>
    <ul class="list-inline">
    </ul>
  </div>
</footer>

    <script src="../../js/jquery-1.11.0.min.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
