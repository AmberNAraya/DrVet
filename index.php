<!DOCTYPE html>
<html lang="en">

<head>
  <title>Veterinaria Paws</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="author" content="">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="fonts/icomoon.css">
  <link rel="stylesheet" type="text/css" href="css/vendor.css">
  <!--Bootstrap ================================================== -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&display=swap" rel="stylesheet">
  <link
    href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Syne:wght@600;700;800&display=swap"
    rel="stylesheet">
</head>

<!--Empezar a programar desde aquí ================================================== -->

<body class="hompage bg-accent-light">
  <header id="header" class=" content-light ">
    <div class="header-wrap container py-3">
      <div class="row align-items-center">
        <div class="primary-nav col-md-5 col-sm-2">
          <nav class="navbar">
            <div class="main-menu">
              <ul class="menu-list  list-unstyled d-flex m-0 ">
                <li class="menu-itemhome1 dropdown">
                  <a class="text-uppercase item-anchor dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"> Citas </a>
                  <!-- Menú ================================================== -->
                  <ul class="dropdown-menu">
                    <li class="sub-page pe-0"><a class="text-black text-uppercase dropdown-item" href="index.html">
                        Sacar cita para mi mascota</a></li>
                    <li class="sub-page pe-0"><a class="text-black text-uppercase dropdown-item" href="index.html">
                        Historial Medico</a></li>
                  </ul>
                </li>
                <!-- Ubicación ================================================== -->
                <!-- Asegúrate de que apunte al archivo controlador adecuado -->
                <li class="menu-itemhome2">
                  <a href="./Views/Ubicacion.php" class="text-uppercase item-anchor">Nuestros servicios</a>
                </li>

                <!-- Ubicación ================================================== -->
                <li class="menu-itemhome3">
                  <a href="about-us.html" class="text-uppercase item-anchor">Productos</a>
                </li>

                <!-- Ubicación ================================================== -->
                <li class="menu-itemhome4">
                  <a href="about-us.html" class="text-uppercase item-anchor">Ubicación de la clínica</a>
                </li>
              </ul>
              <div class="hamburger">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
              </div>
            </div>
          </nav>
        </div>

        <!-- Logo principal, centrado. ================================================== -->
        <div class="col-md-2 col-sm-4 brand-block ">
          <div class="main-logo text-lg-center">
            <a href="index.html">
              <img src="images/main-logo.jpg" alt="logo" class="brand-image">
            </a>
          </div>
        </div>

        <div class="right-block col-md-5 col-sm-4">
          <nav class="navbar justify-content-end">
            <div class="user-items">
              <ul class="list-unstyled content-light d-flex align-items-center m-0">
                <li>
                  <i class="icon icon-user"></i>
                  <a href="my-account.html" class="text-uppercase item-anchor">Iniciar Sesión</a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- Banner principal, centrado. ================================================== -->
  <section id="billboard" class="padding-large no-padding-top position-relative">
    <div class="image-holder">
      <!-- Banner imagen ================================================== -->
      <img src="images/banner-image.jpg" alt="banner" class="banner-image">
    </div>
    <!-- Banner Titulo ================================================== -->
    <div class="banner-content content-light style1 text-center col-md-6">
      <h2 class="banner-title">
        <!-- Agregar texto aquí si se desea ================================================== -->
      </h2>
    </div>
  </section>

  <!-- Elementos didácticos ================================================== -->
  <section id="company-services">
    <div class="container my-6">
      <div class="row justify-content-center"> <!-- Centrar toda la fila -->
        <!-- Iconos y su mensaje ================================================== -->
        <div class="icon-box text-center col-md-3 col-sm-6 mb-4">
          <div class="content-box border-top border-bottom">
            <div class="icon-box-icon">
              <img src="images/icon-3.png" alt="Cuidado" class="icon-image">
            </div>
            <div class="icon-content">
              <h3 class="no-margin">Citas</h3>
              <p>Procedimientos varios.</p>
            </div>
          </div>
        </div>

        <!-- Iconos y su mensaje ================================================== -->
        <div class="icon-box text-center col-md-3 col-sm-6 mb-4">
          <div class="content-box border-top border-bottom">
            <div class="icon-box-icon">
              <img src="images/icon-2.png" alt="Cuidado" class="icon-image">
            </div>
            <div class="icon-content">
              <h3 class="no-margin">Productos</h3>
              <p>Medicamentos y más.</p>
            </div>
          </div>
        </div>

        <!-- Iconos y su mensaje ================================================== -->
        <div class="icon-box text-center col-md-3 col-sm-6 mb-4">
          <div class="content-box border-top border-bottom">
            <div class="icon-box-icon">
              <img src="images/icon-1.png" alt="Cuidado" class="icon-image">
            </div>
            <div class="icon-content">
              <h3 class="no-margin">Cuidados.</h3>
              <p>Spa Y Guardería.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  </section>
  <!-- MÁS SERVICIOS ================================================== -->
  <section id="fashion-trending" class="product-store padding-large position-relative overflow-hidden">
    <div class="container mb-5">
      <div class="section-header text-center">
        <h2 class="section-title">Nuestros servicios</h2>
        <p>Ofrecemos una variedad de servicios para la salud de tus mascotas.</p>
      </div>
      <div class="row">
        <div class="swiper product-swiper">
          <div class="swiper-wrapper">
            <!-- Información ================================================== -->
            <div class="swiper-slide">
              <div class="product-item position-relative">
                <div class="image-holder">
                  <img src="images/product-item1.jpg" alt="product-item" class="product-image">
                </div>
                <div class="cart-concern">
                  <div class="cart-button d-flex flex-wrap">
                    <div class="btn-left">
                    </div>
                  </div>
                </div>
                <div class="product-detail text-center">
                  <h3 class="product-title">
                    <h3 class="no-margin">Vacuno</h3>
                  </h3>
                </div>
              </div>
            </div>
            <!-- Información ================================================== -->
            <div class="swiper-slide">
              <div class="product-item position-relative">
                <div class="image-holder">
                  <img src="images/product-item2.jpg" alt="product-item" class="product-image">
                </div>
                <div class="cart-concern">
                  <div class="cart-button d-flex flex-wrap">
                    <div class="btn-left">
                    </div>
                  </div>
                </div>
                <div class="product-detail text-center">
                  <h3 class="product-title">
                    <h3 class="no-margin">Silvestre</h3>
                  </h3>
                </div>
              </div>
            </div>
            <!-- Información ================================================== -->
            <div class="swiper-slide">
              <div class="product-item position-relative">
                <div class="image-holder">
                  <img src="images/product-item3.jpg" alt="product-item" class="product-image">
                </div>
                <div class="cart-concern">
                  <div class="cart-button d-flex flex-wrap">
                    <div class="btn-left">
                    </div>
                  </div>
                </div>
                <div class="product-detail text-center">
                  <h3 class="product-title">
                    <h3 class="no-margin">Dómestico</h3>
                  </h3>
                </div>
              </div>
            </div>
            <!-- Información ================================================== -->
            <div class="swiper-slide">
              <div class="product-item position-relative">
                <div class="image-holder">
                  <img src="images/product-item4.jpg" alt="product-item" class="product-image">
                </div>
                <div class="cart-concern">
                  <div class="cart-button d-flex flex-wrap">
                    <div class="btn-left">
                    </div>
                  </div>
                </div>
                <div class="product-detail text-center">
                  <h3 class="product-title">
                    <h3 class="no-margin">Equino</h3>
                  </h3>
                </div>
              </div>
            </div>
          </div>

          <div class="swiper-button swiper-button-next"></div>
          <div class="swiper-button swiper-button-prev"></div>
        </div>
      </div>
    </div>
    <div class="swiper-pagination"></div>
  </section>

  <!-- Más imágenes ilustrativas ================================================== -->
  <section id="categories" class="overflow-hidden">
    <div class="full-width-container d-flex flex-wrap">
      <!-- Imagen 1 -->
      <div class="category-item left-block col-md-6 col-sm-12 no-padding-left position-relative">
        <div class="image-holder">
          <img id="image-vacunacion" src="images/category-item1.jpg" alt="Vacunación">
        </div>
        <div class="category-content content-light">
        </div>
      </div>
      <!-- Imagen 2 -->
      <div class="right-block col-md-6 col-sm-12 no-padding-right">
        <div class="category-item top-block position-relative">
          <div class="image-holder">
            <img id="image-control" src="images/category-item2.jpg" alt="Control">
          </div>
          <div class="category-content content-light">
          </div>
        </div>
      </div>
    </div>
    </div>
    </div>
  </section>


  <!-- Footer ================================================== -->
  <footer id="footer" class="overflow-hidden">
    <div class="container mt-5">
      <div class="row">
        <div class="footer-top-area">
          <div class="row d-flex flex-wrap justify-content-between">

            <!-- Columna de Logo y Descripción -->
            <div class="col-lg-3 col-sm-6">
              <div class="footer-menu menu-001">
                <img src="images/main-logo.jpg" alt="logo">
                <p>En Paws nuestra prioridad es que los animales se sientan en buenas manos.</p>
                <!-- Links ilustrativos ================================================== -->
                <div class="social-links">
                  <ul class="d-flex list-unstyled">
                    <li>
                      <a href="#">
                        <i class="icon icon-facebook"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="icon icon-instagram1"></i>
                      </a>
                    </li>
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
                <p>Si necesitas ayuda llámanos al: <a href="tel:22478877">2247-8877</a></p>
              </div>
            </div>

          </div> <!-- End row d-flex -->
        </div> <!-- End footer-top-area -->
      </div> <!-- End row -->
    </div> <!-- End container -->
    <hr>
  </footer>

  <!-- script ================================================== -->
  <script src="js/jquery-1.11.0.min.js"></script>
  <script src="js/plugins.js"></script>
  <script src="js/script.js"></script>
  <!-- Bootstarp script ================================================== -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
</body>

</html>