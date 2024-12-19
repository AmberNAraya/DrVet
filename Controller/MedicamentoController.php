<?php
require_once __DIR__ . '/../Model/MedicamentoModel.php';

class MedicamentoController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new MedicamentoModel($dbConnection);
    }

    public function listarMedicamentos() {
        $medicamentos = $this->model->obtenerMedicamentos();
        include __DIR__ . '/../Views/medicamento/list_table.php';
    }

    public function crearMedicamento($data) {
        $resultado = $this->model->insertarMedicamento($data);
        if ($resultado) {
            header("Location: /DrVet/Views/medicamento/list.php");
            exit();
        } else {
            echo "Error al crear el medicamento.";
        }
    }

    public function obtenerMedicamento($id) {
        return $this->model->obtenerMedicamentoPorId($id);
    }

    public function actualizarMedicamento($id, $data) {
        $resultado = $this->model->editarMedicamento($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/medicamento/list.php");
            exit();
        } else {
            echo "Error al actualizar el medicamento.";
        }
    }

    public function eliminarMedicamento($id) {
        $resultado = $this->model->borrarMedicamento($id);
        if ($resultado) {
            header("Location: /DrVet/Views/medicamento/list.php");
            exit();
        } else {
            echo "Error al eliminar el medicamento.";
        }
    }
}
?>
