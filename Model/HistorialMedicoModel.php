<?php
class HistorialMedicoModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerHistoriales() {
        $query = "SELECT id_historial, descripcion, fecha, id_mascota, id_usuario FROM historial_medico";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $historiales = [];
        while ($row = oci_fetch_assoc($stid)) {
            if (isset($row['DESCRIPCION']) && $row['DESCRIPCION'] instanceof OCILob) {
                $row['DESCRIPCION'] = $row['DESCRIPCION']->load();
            }
            $historiales[] = $row;
        }
        oci_free_statement($stid);

        return $historiales;
    }

    public function insertarHistorial($data) {
        $query = "BEGIN insertar_historial_medico(:descripcion, TO_DATE(:fecha, 'YYYY-MM-DD'), :id_mascota, :id_usuario); END;";
        $stid = oci_parse($this->conn, $query);
    
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':fecha', $data['fecha']);
        oci_bind_by_name($stid, ':id_mascota', $data['id_mascota']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);
    
        $resultado = oci_execute($stid);
    
        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el historial: " . $error['message'];
        }
    
        return $resultado;
    }
    
    public function obtenerHistorialPorId($id) {
        $query = "SELECT id_historial, descripcion, fecha, id_mascota, id_usuario 
                  FROM historial_medico WHERE id_historial = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        if ($row && isset($row['DESCRIPCION']) && $row['DESCRIPCION'] instanceof OCILob) {
            $row['DESCRIPCION'] = $row['DESCRIPCION']->load();
        }

        oci_free_statement($stid);
        return $row;
    }

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

    public function borrarHistorial($id) {
        $query = "DELETE FROM historial_medico WHERE id_historial = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>
