<?php
require_once __DIR__ . '/../Model/ClienteModel.php';

class ClienteController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new ClienteModel($dbConnection);
    }

    public function listarClientes() {
        $clientes = $this->model->obtenerClientes();
        include __DIR__ . '/../Views/cliente/list_table.php';
    }

    public function crearCliente($data) {
        $resultado = $this->model->insertarCliente($data);
        if ($resultado) {
            header("Location: /DrVet/Views/cliente/list.php");
            exit();
        } else {
            echo "Error al crear el cliente.";
        }
    }

    public function obtenerCliente($id) {
        return $this->model->obtenerClientePorId($id);
    }

    public function actualizarCliente($id, $data) {
        $resultado = $this->model->editarCliente($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/cliente/list.php");
            exit();
        } else {
            echo "Error al actualizar el cliente.";
        }
    }

    public function eliminarCliente($id) {
        $resultado = $this->model->borrarCliente($id);
        if ($resultado) {
            header("Location: /DrVet/Views/cliente/list.php");
            exit();
        } else {
            echo "Error al eliminar el cliente.";
        }
    }
}
?>
