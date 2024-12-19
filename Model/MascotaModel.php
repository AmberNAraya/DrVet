<?php
class MascotaModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerMascotas() {
        $query = "SELECT id_mascota, nombre, especie, raza, edad, id_usuario FROM mascota";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $mascotas = [];
        while ($row = oci_fetch_assoc($stid)) {
            $mascotas[] = $row;
        }
        oci_free_statement($stid);

        return $mascotas;
    }

    public function insertarMascota($data) {
        $query = "BEGIN insertar_mascota(:nombre, :especie, :raza, :edad, :id_usuario, :mascota_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':especie', $data['especie']);
        oci_bind_by_name($stid, ':raza', $data['raza']);
        oci_bind_by_name($stid, ':edad', $data['edad']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);

        oci_bind_by_name($stid, ':mascota_id', $mascota_id, 32);

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear la mascota: " . $error['message'];
            return false;
        }

        return $mascota_id;
    }

    public function obtenerMascotaPorId($id) {
        $query = "SELECT id_mascota, nombre, especie, raza, edad, id_usuario FROM mascota WHERE id_mascota = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarMascota($id, $data) {
        $query = "UPDATE mascota SET nombre = :nombre, especie = :especie, raza = :raza, edad = :edad, id_usuario = :id_usuario WHERE id_mascota = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':especie', $data['especie']);
        oci_bind_by_name($stid, ':raza', $data['raza']);
        oci_bind_by_name($stid, ':edad', $data['edad']);
        oci_bind_by_name($stid, ':id_usuario', $data['id_usuario']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarMascota($id) {
        $query = "DELETE FROM mascota WHERE id_mascota = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>
