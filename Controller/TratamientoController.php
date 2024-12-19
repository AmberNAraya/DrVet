<?php
require_once __DIR__ . '/../Model/TratamientoModel.php';

class TratamientoController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new TratamientoModel($dbConnection);
    }

    public function listarTratamientos() {
        $tratamientos = $this->model->obtenerTratamientos();
        include __DIR__ . '/../Views/tratamiento/list_table.php';
    }

    public function crearTratamiento($data) {
        $resultado = $this->model->insertarTratamiento($data);
        if ($resultado) {
            header("Location: /DrVet/Views/tratamiento/list.php");
            exit();
        } else {
            echo "Error al crear el tratamiento.";
        }
    }

    public function obtenerTratamiento($id) {
        return $this->model->obtenerTratamientoPorId($id);
    }

    public function actualizarTratamiento($id, $data) {
        $resultado = $this->model->editarTratamiento($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/tratamiento/list.php");
            exit();
        } else {
            echo "Error al actualizar el tratamiento.";
        }
    }

    public function eliminarTratamiento($id) {
        $resultado = $this->model->borrarTratamiento($id);
        if ($resultado) {
            header("Location: /DrVet/Views/tratamiento/list.php");
            exit();
        } else {
            echo "Error al eliminar el tratamiento.";
        }
    }
}
?>
