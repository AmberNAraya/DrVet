<?php
class UsuarioModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerUsuarios() {
        $query = "SELECT id_usuario, nombre, apellido, telefono, email, rol, fecha_creacion, fecha_actualizacion, fecha_fin FROM usuario";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $usuarios = [];
        while ($row = oci_fetch_assoc($stid)) {
            $usuarios[] = $row;
        }
        oci_free_statement($stid);

        return $usuarios;
    }

    public function insertarUsuario($data) {
        $query = "BEGIN insertar_usuario(:p_nombre, :p_apellido, :p_telefono, :p_email, :p_rol, :p_usuario_id); END;";

        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':p_nombre', $data['nombre']);
        oci_bind_by_name($stid, ':p_apellido', $data['apellido']);
        oci_bind_by_name($stid, ':p_telefono', $data['telefono']);
        oci_bind_by_name($stid, ':p_email', $data['email']);
        oci_bind_by_name($stid, ':p_rol', $data['rol']);

        $p_usuario_id = null;
        oci_bind_by_name($stid, ':p_usuario_id', $p_usuario_id, 32); 

        $resultado = oci_execute($stid);

        if ($resultado) {
            echo "Usuario creado con éxito. ID de Usuario: " . $p_usuario_id;
        } else {
            echo "Error al crear el usuario.";
        }

        oci_free_statement($stid);
    }

    public function obtenerUsuarioPorId($id) {
        $query = "SELECT id_usuario, nombre, apellido, telefono, email, rol, fecha_creacion, fecha_actualizacion, fecha_fin
                  FROM usuario WHERE id_usuario = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarUsuario($id, $data) {
        $query = "UPDATE usuario 
                  SET nombre = :nombre, 
                      apellido = :apellido, 
                      telefono = :telefono, 
                      email = :email, 
                      rol = :rol, 
                      fecha_actualizacion = SYSDATE
                  WHERE id_usuario = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':apellido', $data['apellido']);
        oci_bind_by_name($stid, ':telefono', $data['telefono']);
        oci_bind_by_name($stid, ':email', $data['email']);
        oci_bind_by_name($stid, ':rol', $data['rol']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarUsuario($id) {
        $query = "DELETE FROM usuario WHERE id_usuario = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }

    public function verificarMascotasActivas($id_usuario) {
        $query = "SELECT COUNT(*) AS mascotas_activas FROM mascota WHERE id_usuario = :id_usuario AND estado = 'activo'";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id_usuario', $id_usuario);
        oci_execute($stid);
        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        
        return $row['mascotas_activas'] > 0; 
    }

}
?>
