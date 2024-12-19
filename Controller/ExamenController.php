<?php
require_once __DIR__ . '/../Model/ExamenModel.php';

class ExamenController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new ExamenModel($dbConnection);
    }

    public function listarExamenes() {
        $examenes = $this->model->obtenerExamenes();
        include __DIR__ . '/../Views/examen/list_table.php';
    }

    public function crearExamen($data) {
        $resultado = $this->model->insertarExamen($data);
        if ($resultado) {
            header("Location: /DrVet/Views/examen/list.php");
            exit();
        } else {
            echo "Error al crear el examen.";
        }
    }

    public function obtenerExamen($id) {
        return $this->model->obtenerExamenPorId($id);
    }

    public function actualizarExamen($id, $data) {
        $resultado = $this->model->editarExamen($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/examen/list.php");
            exit();
        } else {
            echo "Error al actualizar el examen.";
        }
    }

    public function eliminarExamen($id) {
        $resultado = $this->model->borrarExamen($id);
        if ($resultado) {
            header("Location: /DrVet/Views/examen/list.php");
            exit();
        } else {
            echo "Error al eliminar el examen.";
        }
    }
}
?>
