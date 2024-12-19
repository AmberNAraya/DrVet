<?php
class TratamientoModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerTratamientos() {
        $query = "SELECT id_tratamiento, descripcion, medicina, duracion, id_historial, id_producto, id_usuario, id_veterinario 
                  FROM tratamiento";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $tratamientos = [];
        while ($row = oci_fetch_assoc($stid)) {
            $tratamientos[] = $row;
        }
        oci_free_statement($stid);

        return $tratamientos;
    }

    public function insertarTratamiento($data) {
        $query = "BEGIN insertar_tratamiento(:descripcion, :medicina, :duracion, :id_historial, :id_producto, :id_usuario, :id_veterinario, :tratamiento_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':medicina', $data['medicina']);
        oci_bind_by_name($stid, ':duracion', $data['duracion']);
        oci_bind_by_name($stid, ':id_historial', $data['id_historial']);
        oci_bind_by_name($stid, ':id_producto', $data['id_producto']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);
        oci_bind_by_name($stid, ':id_veterinario', $data['id_veterinario']);

        oci_bind_by_name($stid, ':tratamiento_id', $tratamiento_id, 32); 

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el tratamiento: " . $error['message'];
            return false;
        }

        return $tratamiento_id;
    }

    public function obtenerTratamientoPorId($id) {
        $query = "SELECT id_tratamiento, descripcion, medicina, duracion, id_historial, id_producto, id_usuario, id_veterinario
                  FROM tratamiento WHERE id_tratamiento = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarTratamiento($id, $data) {
        $query = "UPDATE tratamiento
                  SET descripcion = :descripcion,
                      medicina = :medicina,
                      duracion = :duracion,
                      id_historial = :id_historial,
                      id_producto = :id_producto,
                      id_usuario = :id_usuario,
                      id_veterinario = :id_veterinario
                  WHERE id_tratamiento = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':medicina', $data['medicina']);
        oci_bind_by_name($stid, ':duracion', $data['duracion']);
        oci_bind_by_name($stid, ':id_historial', $data['id_historial']);
        oci_bind_by_name($stid, ':id_producto', $data['id_producto']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);
        oci_bind_by_name($stid, ':id_veterinario', $data['id_veterinario']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarTratamiento($id) {
        $query = "DELETE FROM tratamiento WHERE id_tratamiento = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>
