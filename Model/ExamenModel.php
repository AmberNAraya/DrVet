<?php
class ExamenModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerExamenes() {
        $query = "SELECT id_examen, tipo, fecha, resultado, id_mascota, id_tratamiento FROM examen";
        $stid = oci_parse($this->conn, $query);
        
        if (!oci_execute($stid)) {
            $error = oci_error($stid);
            echo "Error al obtener los exámenes: " . $error['message'];
            oci_free_statement($stid);
            return false;
        }

        $examenes = [];
        while ($row = oci_fetch_assoc($stid)) {
            $examenes[] = $row;
        }
        oci_free_statement($stid);

        return $examenes;
    }

    public function insertarExamen($data) {
        $query = "BEGIN insertar_examen(:tipo, TO_DATE(:fecha, 'YYYY-MM-DD'), :resultado, :id_mascota, :id_tratamiento, :examen_id); END;";

        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':tipo', $data['tipo']);
        oci_bind_by_name($stid, ':fecha', $data['fecha']);
        oci_bind_by_name($stid, ':resultado', $data['resultado']);
        oci_bind_by_name($stid, ':id_mascota', $data['id_mascota']);
        oci_bind_by_name($stid, ':id_tratamiento', $data['id_tratamiento']);
        
        oci_bind_by_name($stid, ':examen_id', $examen_id, 32); 

        if (!oci_execute($stid)) {
            $error = oci_error($stid);
            echo "Error al crear el examen: " . $error['message'];
            oci_free_statement($stid);
            return false;
        }

        oci_free_statement($stid);

        return $examen_id;  
    }

    public function obtenerExamenPorId($id) {
        $query = "SELECT id_examen, tipo, fecha, resultado, id_mascota, id_tratamiento 
                  FROM examen WHERE id_examen = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        
        if (!oci_execute($stid)) {
            $error = oci_error($stid);
            echo "Error al obtener el examen: " . $error['message'];
            oci_free_statement($stid);
            return false;
        }

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarExamen($id, $data) {
        $query = "UPDATE examen 
                  SET tipo = :tipo, 
                      fecha = TO_DATE(:fecha, 'YYYY-MM-DD'), 
                      resultado = :resultado, 
                      id_mascota = :id_mascota, 
                      id_tratamiento = :id_tratamiento 
                  WHERE id_examen = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':tipo', $data['tipo']);
        oci_bind_by_name($stid, ':fecha', $data['fecha']);
        oci_bind_by_name($stid, ':resultado', $data['resultado']);
        oci_bind_by_name($stid, ':id_mascota', $data['id_mascota']);
        oci_bind_by_name($stid, ':id_tratamiento', $data['id_tratamiento']);
        oci_bind_by_name($stid, ':id', $id);

        if (!oci_execute($stid)) {
            $error = oci_error($stid);
            echo "Error al editar el examen: " . $error['message'];
            oci_free_statement($stid);
            return false;
        }

        oci_free_statement($stid);
        return true;
    }

    public function borrarExamen($id) {
        $query = "DELETE FROM examen WHERE id_examen = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);

        if (!oci_execute($stid)) {
            $error = oci_error($stid);
            echo "Error al borrar el examen: " . $error['message'];
            oci_free_statement($stid);
            return false;
        }

        oci_free_statement($stid);
        return true;
    }
}
?>
