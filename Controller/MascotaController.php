<?php
require_once __DIR__ . '/../Model/MascotaModel.php';

class MascotaController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new MascotaModel($dbConnection);
    }

    public function listarMascotas() {
        $mascotas = $this->model->obtenerMascotas();
        include __DIR__ . '/../Views/mascota/list_table.php';
    }

    public function crearMascota($data) {
        $resultado = $this->model->insertarMascota($data);
        if ($resultado) {
            header("Location: /DrVet/Views/mascota/list.php");
            exit();
        } else {
            echo "Error al crear la mascota.";
        }
    }

    public function obtenerMascota($id) {
        return $this->model->obtenerMascotaPorId($id);
    }

    public function actualizarMascota($id, $data) {
        $resultado = $this->model->editarMascota($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/mascota/list.php");
            exit();
        } else {
            echo "Error al actualizar la mascota.";
        }
    }

    public function eliminarMascota($id) {
        $resultado = $this->model->borrarMascota($id);
        if ($resultado) {
            header("Location: /DrVet/Views/mascota/list.php");
            exit();
        } else {
            echo "Error al eliminar la mascota.";
        }
    }
}
?>
