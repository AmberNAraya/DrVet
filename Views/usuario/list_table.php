<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="../../css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../fonts/icomoon.css">
    <link rel="stylesheet" type="text/css" href="../../css/vendor.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../style.css">
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        body {
            font-family: 'DM Sans', sans-serif;
            background-color: #f8f9fa;
        }

        .profile-box {
            background-color: #ADB8B2;
            border-radius: 15px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 5rem auto;
            padding: 2rem;
            text-align: center;
        }

        .profile-box img {
            width: 50px;
            height: 50px;
            margin-bottom: 1rem;
        }

        .profile-box h1 {
            color: #2A2A2A;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .profile-box p {
            color: #2A2A2A;
            margin: 0.5rem 0;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .profile-header img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }

        .task-summary {
            margin: 2rem 0;
            text-align: center;
        }

        .task-summary .circle {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: conic-gradient(
                #28a745 70%,
                #ffc107 20%,
                #dc3545 10%
            );
            margin: 0 auto;
            position: relative;
        }

        .task-summary .circle::after {
            content: "";
            width: 80px;
            height: 80px;
            background-color: #fff;
            border-radius: 50%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .task-summary p {
            margin-top: 1rem;
        }

        .task-list .task-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1rem;
        }

        .task-list .task-item img {
            width: 50px;
            height: 50px;
            border-radius: 8px;
        }

        .task-list .task-item .details {
            flex-grow: 1;
            margin-left: 1rem;
        }

        .task-list .task-item .details h5 {
            margin: 0;
        }

        .task-list .task-item .details span {
            font-size: 0.9rem;
            color: #6c757d;
        }
    </style>
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

   <!-- Main Banner -->
<section id="banner" class="text-center py-5" style="background: url('../../img/pexels-pixabay-33287.jpg') no-repeat center center; background-size: cover;">
  <div class="container text-light" style="background-color: rgba(0, 0, 0, 0.5); padding: 2rem; border-radius: 15px;">
    <h1>Perfil de usuario</h1>
    <p>Bienvenido a Dr Pet</p>
    <p>¡Ingresa tus mascotas!</p>
  </div>
</section>

  <div class="profile-box">
    <img src="../../img/usuario.png" alt="Icono de Usuario"> 
    <h2>Información del Usuario</h2>
    <br>
    <p><strong>Nombre: Juan</strong></p>
    <p><strong>Apellido: Perez</strong></p>
    <p><strong>Teléfono: 5551234567</strong></p>
    <p><strong>Email: juan.perez@example.com</strong></p>
</div>

<br>

<hr style="border: 1px solidrgb(56, 56, 56); margin: 2rem 0;">

  <div class="container py-4">
    <h2>Lista de la mascota</h2>
    <h4>Paciente: Akira</h4> <br>
        <!-- Task List -->
        <div class="task-list">
            <div class="task-item">
                <img src="../../img/perro.png" alt="Tarea">
                <div class="details">
                    <h5>Radiografía</h5>
                    <span>07:00 AM - Lunes</span>
                </div>
                <input type="checkbox">
            </div>

            <div class="task-item">
                <img src="../../img/medicina.png" alt="Tarea">
                <div class="details">
                    <h5>Administrar medicamentos</h5>
                    <span>08:45 AM - Diario por una semana</span>
                </div>
                <input type="checkbox">
            </div>

            <div class="task-item">
                <img src="../../img/veterinario (1).png" alt="Tarea">
                <div class="details">
                    <h5>Cirugía</h5>
                    <span>03:30 PM - Martes</span>
                </div>
                <input type="checkbox">
            </div>

            <div class="task-item">
                <img src="../../img/medicina.png" alt="Tarea">
                <div class="details">
                    <h5>Administrar medicamentos</h5>
                    <span>08:45 PM - Diario por una semana</span>
                </div>
                <input type="checkbox">
            </div>
            </div>
            <a href="../../Views/mascota/list.php" style="background-color: #F4A261; color: #fff; border: none; display: block; width: fit-content; margin: 2rem auto; padding: 0.5rem 1.5rem; text-align: center; border-radius: 10px;">Más Mascotas</a>

    </div>

    <hr style="border: 1px solidrgb(69, 69, 69); margin: 2rem 0;">
<br>


  <section class="container my-5">
  <div class="p-4 shadow-sm" style="background-color: #D68C45; border-radius: 15px;">
    <!-- Título -->
    <h1 class="text-center mb-4" style="color:rgb(42, 42, 42); font-weight: bold;">Listado de Usuarios</h1>

    <!-- Botón Crear Usuario -->
    <div class="text-end mb-3">
      <a href="/DrVet/Views/usuario/form.php" class="btn btn-success" style="background-color:rgb(255, 255, 255); border-color: #E4CCC5; color: rgb(0, 0, 0);">Crear Nuevo Usuario</a>
    </div>

    <!-- Tabla -->
    <table class="table table-bordered table-hover text-center" style="background-color:rgb(255, 255, 255);">
      <thead class="table-light" style="background-color:rgb(255, 255, 255); color:rgb(35, 35, 35);">
        <tr>
          <th>ID</th>
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Teléfono</th>
          <th>Email</th>
          <th>Rol</th>
          <th>Fecha de Creación</th>
          <th>Fecha de Actualización</th>
          <th>Fecha Fin</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        <?php if (!empty($usuarios)): ?>
          <?php foreach ($usuarios as $usuario): ?>
            <tr>
              <td><?= htmlspecialchars($usuario['ID_USUARIO']) ?></td>
              <td><?= htmlspecialchars($usuario['NOMBRE']) ?></td>
              <td><?= htmlspecialchars($usuario['APELLIDO']) ?></td>
              <td><?= htmlspecialchars($usuario['TELEFONO']) ?></td>
              <td><?= htmlspecialchars($usuario['EMAIL']) ?></td>
              <td><?= htmlspecialchars($usuario['ROL']) ?></td>
              <td><?= htmlspecialchars($usuario['FECHA_CREACION']) ?></td>
              <td><?= htmlspecialchars($usuario['FECHA_ACTUALIZACION']) ?></td>
              <td><?= htmlspecialchars($usuario['FECHA_FIN']) ?></td>
              <td>
                <a href="/DrVet/Views/usuario/form.php?id=<?= $usuario['ID_USUARIO'] ?>" class="btn btn-primary btn-sm">Editar</a>
                <a href="/DrVet/Views/usuario/delete.php?id=<?= $usuario['ID_USUARIO'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">Eliminar</a>
              </td>
            </tr>
          <?php endforeach; ?>
        <?php else: ?>
          <tr>
            <td colspan="10">No hay registros disponibles.</td>
          </tr>
        <?php endif; ?>
      </tbody>
    </table>
  </div>
</section>


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

</body>
</html>
