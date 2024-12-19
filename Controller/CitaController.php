<?php
require_once __DIR__ . '/../Model/CitaModel.php';

class CitaController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new CitaModel($dbConnection);
    }

    public function listarCitas() {
        $citas = $this->model->obtenerCitas();
        include __DIR__ . '/../Views/cita/list_table.php';
    }

    public function crearCita($data) {
        $resultado = $this->model->insertarCita($data);
        if ($resultado) {
            header("Location: /DrVet/Views/cita/list.php");
            exit();
        } else {
            echo "Error al crear la cita.";
        }
    }

    public function obtenerCita($id) {
        return $this->model->obtenerCitaPorId($id);
    }

    public function actualizarCita($id, $data) {
        $resultado = $this->model->editarCita($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/cita/list.php");
            exit();
        } else {
            echo "Error al actualizar la cita.";
        }
    }

    public function eliminarCita($id) {
        $resultado = $this->model->borrarCita($id);
        if ($resultado) {
            header("Location: /DrVet/Views/cita/list.php");
            exit();
        } else {
            echo "Error al eliminar la cita.";
        }
    }
}
?>
