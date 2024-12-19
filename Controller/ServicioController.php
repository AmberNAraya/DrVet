<?php
require_once __DIR__ . '/../Model/ServicioModel.php';

class ServicioController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new ServicioModel($dbConnection);
    }

    public function listarServicios() {
        $servicios = $this->model->obtenerServicios();
        include __DIR__ . '/../Views/servicio/list_table.php';
    }

    public function crearServicio($data) {
        $resultado = $this->model->insertarServicio($data);
        if ($resultado) {
            header("Location: /DrVet/Views/servicio/list.php");
            exit();
        } else {
            echo "Error al crear el servicio.";
        }
    }

    public function obtenerServicio($id) {
        return $this->model->obtenerServicioPorId($id);
    }

    public function actualizarServicio($id, $data) {
        $resultado = $this->model->editarServicio($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/servicio/list.php");
            exit();
        } else {
            echo "Error al actualizar el servicio.";
        }
    }

    public function eliminarServicio($id) {
        $resultado = $this->model->borrarServicio($id);
        if ($resultado) {
            header("Location: /DrVet/Views/servicio/list.php");
            exit();
        } else {
            echo "Error al eliminar el servicio.";
        }
    }
}
?>
