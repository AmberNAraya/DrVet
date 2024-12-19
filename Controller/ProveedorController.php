<?php
require_once __DIR__ . '/../Model/ProveedorModel.php';

class ProveedorController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new ProveedorModel($dbConnection);
    }

    public function listarProveedores() {
        $proveedores = $this->model->obtenerProveedores();
        include __DIR__ . '/../Views/proveedor/list_table.php';
    }

    public function crearProveedor($data) {
        $resultado = $this->model->insertarProveedor($data);
        if ($resultado) {
            header("Location: /DrVet/Views/proveedor/list.php");
            exit();
        } else {
            echo "Error al crear el proveedor.";
        }
    }

    public function obtenerProveedor($id) {
        return $this->model->obtenerProveedorPorId($id);
    }

    public function actualizarProveedor($id, $data) {
        $resultado = $this->model->editarProveedor($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/proveedor/list.php");
            exit();
        } else {
            echo "Error al actualizar el proveedor.";
        }
    }

    public function eliminarProveedor($id) {
        $resultado = $this->model->borrarProveedor($id);
        if ($resultado) {
            header("Location: /DrVet/Views/proveedor/list.php");
            exit();
        } else {
            echo "Error al eliminar el proveedor.";
        }
    }
}
?>
