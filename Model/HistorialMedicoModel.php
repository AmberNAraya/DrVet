<?php
class HistorialMedicoModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    // Obtener todos los historiales médicos
    public function obtenerHistoriales() {
        $query = "SELECT id_historial, descripcion, fecha, id_mascota, id_usuario FROM historial_medico";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $historiales = [];
        while ($row = oci_fetch_assoc($stid)) {
            // Descripción ya no es un LOB, por lo que no es necesario cargarla
            $historiales[] = $row;
        }
        oci_free_statement($stid);

        return $historiales;
    }

    // Insertar un nuevo historial médico
    public function insertarHistorial($data) {
        $query = "BEGIN insertar_historial(:descripcion, TO_DATE(:fecha, 'YYYY-MM-DD'), :id_mascota, :id_usuario, :historial_id); END;";
        $stid = oci_parse($this->conn, $query);

        // Enlazar los parámetros de entrada
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':fecha', $data['fecha']);
        oci_bind_by_name($stid, ':id_mascota', $data['id_mascota']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);

        // Parámetro de salida para el ID del historial
        oci_bind_by_name($stid, ':historial_id', $historial_id, 32); // 32 es el tamaño máximo para el ID

        // Ejecutar la sentencia
        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el historial: " . $error['message'];
            return false;
        }

        // Retornar el ID del historial insertado
        return $historial_id;
    }

    // Obtener un historial médico por ID
    public function obtenerHistorialPorId($id) {
        $query = "SELECT id_historial, descripcion, fecha, id_mascota, id_usuario 
                  FROM historial_medico WHERE id_historial = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    // Editar un historial médico existente
    public function editarHistorial($id, $data) {
        $query = "UPDATE historial_medico 
                  SET descripcion = :descripcion, 
                      fecha = TO_DATE(:fecha, 'YYYY-MM-DD'), 
                      id_mascota = :id_mascota, 
                      id_usuario = :id_usuario 
                  WHERE id_historial = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':fecha', $data['fecha']);
        oci_bind_by_name($stid, ':id_mascota', $data['id_mascota']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    // Borrar un historial médico por ID
    public function borrarHistorial($id) {
        $query = "DELETE FROM historial_medico WHERE id_historial = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>
