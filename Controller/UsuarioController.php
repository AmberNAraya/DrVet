<?php
require_once __DIR__ . '/../Model/UsuarioModel.php';

class UsuarioController {
    private $model;

    public function __construct($dbConnection) {
        $this->model = new UsuarioModel($dbConnection);
    }

    public function listarUsuarios() {
        $usuarios = $this->model->obtenerUsuarios();
        include __DIR__ . '/../Views/usuario/list_table.php';
    }

    public function crearUsuario($data) {
        $resultado = $this->model->insertarUsuario($data);
        if ($resultado) {
            header("Location: /DrVet/Views/usuario/list.php");
            exit();
        } else {
            echo "Error al crear el usuario.";
        }
    }

    public function obtenerUsuario($id) {
        return $this->model->obtenerUsuarioPorId($id);
    }

    public function actualizarUsuario($id, $data) {
        $resultado = $this->model->editarUsuario($id, $data);
        if ($resultado) {
            header("Location: /DrVet/Views/usuario/list.php");
            exit();
        } else {
            echo "Error al actualizar el usuario.";
        }
    }

    public function eliminarUsuario($id) {
        $usuarioConMascotas = $this->model->verificarMascotasActivas($id);
    
        if ($usuarioConMascotas) {
            echo "No se puede eliminar el usuario porque tiene mascotas activas.";
            return;
        }
    
        $resultado = $this->model->borrarUsuario($id);
        if ($resultado) {
            header("Location: /DrVet/Views/usuario/list.php");
            exit();
        } else {
            echo "Error al eliminar el usuario.";
        }
    }

}
?>
