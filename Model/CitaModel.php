<?php
class CitaModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerCitas() {
        $query = "SELECT id_cita, fecha, hora, motivo, id_mascota, id_usuario, asistencia FROM cita";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $citas = [];
        while ($row = oci_fetch_assoc($stid)) {
            $citas[] = $row;
        }
        oci_free_statement($stid);

        return $citas;
    }

    public function insertarCita($data) {
        $fecha = date('Y-m-d', strtotime($data['fecha'])); 
        $hora = date('H:i:s', strtotime($data['hora']));   
    
        $fecha_hora = $fecha . ' ' . $hora;
    
        $query = "BEGIN insertar_cita(TO_DATE(:fecha_hora, 'YYYY-MM-DD HH24:MI:SS'), :motivo, :id_mascota, :id_usuario, :asistencia, :cita_id); END;";
        $stid = oci_parse($this->conn, $query);
    
        oci_bind_by_name($stid, ':fecha_hora', $fecha_hora); 
        oci_bind_by_name($stid, ':motivo', $data['motivo']);
        oci_bind_by_name($stid, ':id_mascota', $data['id_mascota']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);
        oci_bind_by_name($stid, ':asistencia', $data['asistencia']);
    
        oci_bind_by_name($stid, ':cita_id', $cita_id, 32);  

        $resultado = oci_execute($stid);
    
        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear la cita: " . $error['message'];
            return false;
        }
    
        return $cita_id;
    }
    

    public function obtenerCitaPorId($id) {
        $query = "SELECT id_cita, fecha, hora, motivo, id_mascota, id_usuario, asistencia FROM cita WHERE id_cita = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarCita($id, $data) {
        $fecha = date('Y-m-d', strtotime($data['fecha']));
        $hora = date('H:i:s', strtotime($data['hora']));

        $query = "UPDATE cita 
                  SET fecha = TO_DATE(:fecha, 'YYYY-MM-DD'), 
                      hora = :hora, 
                      motivo = :motivo, 
                      id_mascota = :id_mascota, 
                      id_usuario = :id_usuario, 
                      asistencia = :asistencia 
                  WHERE id_cita = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':fecha', $fecha);
        oci_bind_by_name($stid, ':hora', $hora);  
        oci_bind_by_name($stid, ':motivo', $data['motivo']);
        oci_bind_by_name($stid, ':id_mascota', $data['id_mascota']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);
        oci_bind_by_name($stid, ':asistencia', $data['asistencia']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarCita($id) {
        $query = "DELETE FROM cita WHERE id_cita = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>
