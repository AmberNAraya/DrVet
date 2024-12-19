<?php
require_once __DIR__ . '/../Model/ProductoModel.php';

class ProductoController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new ProductoModel($dbConnection);
    }

    public function listarProductos() {
        $productos = $this->model->obtenerProductos();
        include __DIR__ . '/../Views/producto/list_table.php';
    }

    public function crearProducto($data) {
        $resultado = $this->model->insertarProducto($data);
        if ($resultado) {
            header("Location: /DrVet/Views/producto/list.php");
            exit();
        } else {
            echo "Error al crear el producto.";
        }
    }

    public function obtenerProducto($id) {
        return $this->model->obtenerProductoPorId($id);
    }

    public function actualizarProducto($id, $data) {
        $resultado = $this->model->editarProducto($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/producto/list.php");
            exit();
        } else {
            echo "Error al actualizar el producto.";
        }
    }

    public function eliminarProducto($id) {
        $resultado = $this->model->borrarProducto($id);
        if ($resultado) {
            header("Location: /DrVet/Views/producto/list.php");
            exit();
        } else {
            echo "Error al eliminar el producto.";
        }
    }
}
?>
