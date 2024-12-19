<!DOCTYPE html>
<html lang="en">

<head>
  <title>DrPet</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Veterinaria Paws - Cuidado y servicios para tus mascotas.">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>

<body class="homepage bg-light">
  <!-- Header -->
  <header id="header" class="bg-white text-dark py-3 shadow">
    <div class="container">
      <div class="d-flex justify-content-between align-items-center">
        <!-- Logo -->
        <a href="index.php" class="navbar-brand text-dark d-flex align-items-center">
          <img src="img/perro-tejonero.png" alt="Logo" class="logo me-2" width="50">
          <span>DrPet</span>
        </a>
        <nav class="navbar">
          <ul class="nav">
            <li class="nav-item"><a href="Views/cliente/list.php" class="nav-link text-dark">Cliente</a></li>
            <li class="nav-item"><a href="Views/servicio/list.php" class="nav-link text-dark">Servicio</a></li>
            
            <!-- Dropdown for Ubicación -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-dark" href="Views/inventario/list.php" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Productos
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="Views/inventario/list.php">Inventario</a></li>
                <li><a class="dropdown-item" href="Views/producto/list.php">Producto</a></li>
                <li><a class="dropdown-item" href="Views/proveedor/list.php">Proveedor</a></li>
                <li><a class="dropdown-item" href="Views/medicamento/list.php">Medicamento</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-dark" href="Views/inventario/list.php" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Mascota
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="Views/examen/list.php">Examenes</a></li>
                <li><a class="dropdown-item" href="Views/historial_medico/list.php">Historial Medico</a></li>
                <li><a class="dropdown-item" href="Views/tratamiento/list.php">Tratamiento</a></li>
              </ul>
            </li>
          </ul>
          
          <!-- Profile Image as Link -->
          <a href="views/usuario/list.php">
            <img src="img/usuario.png" alt="Imagen de Usuario" class="rounded-circle" width="28" height="28">
          </a>
        </nav>
      </div>
    </div>
  </header>
</body>




  <!-- Main Banner -->
<section id="banner" class="text-center py-5" style="background: url('img/pexels-chevonrossouw-2558605.jpg') no-repeat center center; background-size: cover;">
  <div class="container text-light" style="background-color: rgba(0, 0, 0, 0.5); padding: 2rem; border-radius: 15px;">
    <h1>Bienvenidos a DrPet</h1>
    <p>Nos preocupamos por la salud de tus mascotas</p>
    <p>¡Reserva tu cita hoy y mantén a tu mascota feliz y saludable con nosotros!</p>
    <!-- Botón para sacar una cita -->
    <a href="Views/cita/list.php" class="btn mt-3" style="background-color: #F6A985; color: #fff; border: none; padding: 5px 20px; border-radius: 5px; font-size: 16px; text-decoration: none;">
  Cita
</a>
  </div>
</section>

<section id="info-boxes" class="position-relative" style="margin-top: -30px;">
  <div class="container d-flex justify-content-center">
    <!-- Rectangle 1 -->
    <div class="info-box text-center p-3 m-3" style="background-color: #fff; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); width: 25%; font-size: 14px;">
      <!-- Icon Space -->
      <div class="icon mb-3">
        <img src="img/veterinario.png" alt="Cuidado Médico" width="50">
      </div>
      <h3>Cuidado Médico</h3>
      <p>Ofrecemos servicios de consulta, vacunación y tratamientos especializados.</p>
    </div>
    <!-- Rectangle 2 -->
    <div class="info-box text-center p-3 m-3" style="background-color: #fff; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); width: 25%; font-size: 14px;">
      <!-- Icon Space -->
      <div class="icon mb-3">
        <img src="img/bano.png" alt="Servicios de Estética" width="50">
      </div>
      <h3>Servicios de Estética</h3>
      <p>Baños, cortes de pelo y cuidado completo para tu mascota.</p>
    </div>
    <!-- Rectangle 3 -->
    <div class="info-box text-center p-3 m-3" style="background-color: #fff; border-radius: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); width: 25%; font-size: 14px;">
      <!-- Icon Space -->
      <div class="icon mb-3">
        <img src="img/huesos.png" alt="Productos" width="50">
      </div>
      <h3>Productos</h3>
      <p>Encuentra alimentos, juguetes y accesorios para el bienestar de tu mascota.</p>
    </div>
  </div>
</section>


<br>
<br>
<br>

 <!-- Services Section -->
<section id="services" class="py-5">
  <div class="container text-center">
    <h2 class="fw-bold">Nuestro Servicios</h2>
    <p class="mt-3">
    En nuestra clínica ofrecemos una amplia gama de servicios veterinarios para garantizar la salud y el bienestar de su mascota. <br>
    Nuestros especialistas experimentados y nuestro moderno equipo garantizan la mejor atención y tratamiento para su amigo de cuatro patas.
    </p>

    <div class="services-grid mt-5">
      <div class="service-box" style="background-color: #ADB8B2;">Consulta veterinaria</div>
      <div class="service-box" style="background-color: #D68C45;">Cirugía</div>
      <div class="service-box" style="background-color: #869B8F;">Radiografías e imágenes</div>
      <div class="service-box with-border" style="background-color:rgb(255, 247, 247); ">Vacunas</div>
      <div class="service-box with-border" style="background-color:rgb(241, 241, 241);">Cuidado dental</div>
      <div class="service-box" style="background-color:rgb(253, 253, 230);">Pruebas de laboratorio</div>
      <div class="service-box" style="background-color: #E4CCC5;">Ultrasonido</div>
    </div>
  </div>
</section>

<style>
  /* Grid container */
  .services-grid {
    display: grid;
    grid-template-columns: repeat(4, 150px); /* 4 columns of fixed width */
    grid-auto-rows: 150px; /* Each row 150px height */
    gap: 15px; /* Space between boxes */
    justify-content: center; /* Center grid horizontally */
  }

  /* Individual service boxes */
  .service-box {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 5px;
  }

  /* Specific grid positioning */
  .service-box:nth-child(1) {
    grid-column: 1 / 2;
    grid-row: 1 / 2;
  }
  .service-box:nth-child(2) {
    grid-column: 2 / 3;
    grid-row: 1 / 2;
  }
  .service-box:nth-child(3) {
    grid-column: 3 / 4;
    grid-row: 1 / 2;
  }
  .service-box:nth-child(4) {
    grid-column: 1 / 2;
    grid-row: 2 / 3;
  }
  .service-box:nth-child(5) {
    grid-column: 2 / 3;
    grid-row: 2 / 3;
  }
  .service-box:nth-child(6) {
    grid-column: 3 / 4;
    grid-row: 2 / 3;
  }
  .service-box:nth-child(7) {
    grid-column: 4 / 5;
    grid-row: 1 / 3; /* Spans 2 rows */
  }

</style>


<br>
<br>
<br>

<!-- Productos-->
<section id="products" class="py-5" style="background-color: rgb(194, 207, 200); position: relative;">
  <div class="container">
    <div class="row align-items-center">
      <!-- Imagen del perro con ícono de fondo -->
      <div class="col-md-3 text-center" style="position: relative; margin-left: 40px;">
        <!-- Ícono de fondo más grande y movido a la derecha -->
        <img src="img/patas (1).png" alt="Ícono decorativo" 
             style="position: absolute; top: 0; left: 70%; transform: translate(-53%, 0); 
                    width: 90%; opacity: 0.4; z-index: 1;">
        <!-- Imagen principal -->
        <img src="img/image (1).png" alt="Perro" class="img-fluid" 
             style="max-width: 130%; border-radius: 10px; position: relative; z-index: 2;">
      </div>
      <!-- Contenido a la izquierda, un poco más a la izquierda -->
      <div class="col-md-7 offset-md-3" style="max-width: 530px;">
        <h2 class="mb-3">Nos encanta cuidar de tus mascotas.</h2>
        <p>
          Por eso es que ofrecemos una amplia variedad de productos para garantizar el bienestar y cuidado de tus mascotas. Desde alimentos de alta calidad hasta accesorios y juguetes que fomentan su desarrollo físico y emocional.
        </p>
        <p>
          Encuentra todo lo que necesitas para cada etapa de vida de tu mascota, con marcas confiables y los mejores precios.
        </p>
      </div>
    </div>
  </div>
</section>



 <!-- Location Section -->
<section id="location" class="py-5" style="background-color: #ffffff;">
  <div class="container text-center">
    <h2 style="color: #FFA07A;">Ubicación de la Clínica</h2> <!-- Naranja pastel -->
    <p>Visítanos en nuestra clínica para una atención personalizada.</p>
  </div>
  <br>
  <br>
  <!-- Contact Info -->
  <div class="container">
    <div class="row justify-content-center">
      <!-- Dirección -->
      <div class="col-md-4 mb-3 text-center">
        <div class="d-flex align-items-center justify-content-center">
          <i class="fas fa-map-marker-alt fa-2x me-3"></i>
          <div>
            <h5>Dirección</h5>
            <p>Calle 123, San Jose, Costa Rica</p>
          </div>
        </div>
      </div>

      <!-- Teléfono -->
      <div class="col-md-4 mb-3">
        <div class="text-center">
          <i class="fas fa-phone-alt fa-2x mb-2"></i>
          <div>
            <h5>Teléfono</h5>
            <p>+123 456 789</p>
          </div>
        </div>
      </div>

      <!-- Correo Electrónico -->
      <div class="col-md-4 mb-3 text-center">
        <div class="d-flex align-items-center justify-content-center">
          <i class="fas fa-envelope fa-2x me-3"></i>
          <div>
            <h5>Correo</h5>
            <p>contacto@clinicadom.com</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>



  <!-- Footer -->
<hr style="border-top: 2px solid #fff; margin-top: 0px;">
<footer id="footer" class="bg-light" style="padding: 10px 0;">
  <div class="container text-center">
    <p>&copy; 2024 DrPet. <br> Todos los derechos reservados.</p>
    <ul class="list-inline">
    </ul>
  </div>
</footer>




  <!-- Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
