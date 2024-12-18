<?php
require_once __DIR__ . '/../Model/HistorialMedicoModel.php';

class HistorialMedicoController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new HistorialMedicoModel($dbConnection);
    }

    public function listarHistoriales() {
        $historiales = $this->model->obtenerHistoriales();
        include __DIR__ . '/../Views/historial_medico/list_table.php';
    }

    public function crearHistorial($data) {
        $resultado = $this->model->insertarHistorial($data);
        if ($resultado) {
            header("Location: /DrVet/Views/historial_medico/list.php");
            exit();
        } else {
            echo "Error al crear el historial.";
        }
    }

    public function obtenerHistorial($id) {
        return $this->model->obtenerHistorialPorId($id);
    }

    public function actualizarHistorial($id, $data) {
        $resultado = $this->model->editarHistorial($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/historial_medico/list.php");
            exit();
        } else {
            echo "Error al actualizar el historial.";
        }
    }

    public function eliminarHistorial($id) {
        $resultado = $this->model->borrarHistorial($id);
        if ($resultado) {
            header("Location: /DrVet/Views/historial_medico/list.php");
            exit();
        } else {
            echo "Error al eliminar el historial.";
        }
    }
}
?>
