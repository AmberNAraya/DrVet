<?php
require_once __DIR__ . '/../Model/InventarioModel.php';

class InventarioController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new InventarioModel($dbConnection);
    }

    public function listarInventarios() {
        $inventarios = $this->model->obtenerInventarios();
        include __DIR__ . '/../Views/inventario/list_table.php';
    }

    public function crearInventario($data) {
        $resultado = $this->model->insertarInventario($data);
        if ($resultado) {
            header("Location: /DrVet/Views/inventario/list.php");
            exit();
        } else {
            echo "Error al crear el inventario.";
        }
    }

    public function obtenerInventario($id) {
        return $this->model->obtenerInventarioPorId($id);
    }

    public function actualizarInventario($id, $data) {
        $resultado = $this->model->editarInventario($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/inventario/list.php");
            exit();
        } else {
            echo "Error al actualizar el inventario.";
        }
    }

    public function eliminarInventario($id) {
        $resultado = $this->model->borrarInventario($id);
        if ($resultado) {
            header("Location: /DrVet/Views/inventario/list.php");
            exit();
        } else {
            echo "Error al eliminar el inventario.";
        }
    }
}
?>
