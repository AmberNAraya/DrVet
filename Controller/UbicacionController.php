<?php
include_once $_SERVER["DOCUMENT_ROOT"] . '/ProyectoAmbienteWeb/Model/UbicacionModel.php';

// controllers/UbicacionController.php
include_once '../Model/UbicacionModel.php';  

class UbicacionController {
    private $ubicacionModel;

    public function __construct() {
        $this->ubicacionModel = new UbicacionModel();
    }

    public function index() {
        // Obtener las ubicaciones desde el modelo
        $ubicaciones = $this->ubicacionModel->obtenerUbicacion();

        // Incluir la vista y pasar la variable $ubicaciones
        include '../Views/Ubicacion.php';
    }
}
