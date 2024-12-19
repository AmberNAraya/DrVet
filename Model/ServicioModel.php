<?php
class ServicioModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function obtenerServicios() {
        $query = "SELECT id_servicio, nombre, descripcion, precio, id_proveedor FROM servicio";
        $stid = oci_parse($this->conn, $query);
        oci_execute($stid);

        $servicios = [];
        while ($row = oci_fetch_assoc($stid)) {
            $servicios[] = $row;
        }
        oci_free_statement($stid);

        return $servicios;
    }

    public function insertarServicio($data) {
        $query = "BEGIN insertar_servicio(:nombre, :descripcion, :precio, :id_proveedor, :servicio_id); END;";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':precio', $data['precio']);
        oci_bind_by_name($stid, ':id_proveedor', $data['id_proveedor']);

        oci_bind_by_name($stid, ':servicio_id', $servicio_id, 32);

        $resultado = oci_execute($stid);

        if (!$resultado) {
            $error = oci_error($stid);
            echo "Error al crear el servicio: " . $error['message'];
            return false;
        }

        return $servicio_id;
    }

    public function obtenerServicioPorId($id) {
        $query = "SELECT id_servicio, nombre, descripcion, precio, id_proveedor 
                  FROM servicio WHERE id_servicio = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        oci_execute($stid);

        $row = oci_fetch_assoc($stid);
        oci_free_statement($stid);
        return $row;
    }

    public function editarServicio($id, $data) {
        $query = "UPDATE servicio 
                  SET nombre = :nombre, 
                      descripcion = :descripcion, 
                      precio = :precio, 
                      id_proveedor = :id_proveedor 
                  WHERE id_servicio = :id";
        $stid = oci_parse($this->conn, $query);

        oci_bind_by_name($stid, ':nombre', $data['nombre']);
        oci_bind_by_name($stid, ':descripcion', $data['descripcion']);
        oci_bind_by_name($stid, ':precio', $data['precio']);
        oci_bind_by_name($stid, ':id_proveedor', $data['id_proveedor']);
        oci_bind_by_name($stid, ':id', $id);

        return oci_execute($stid);
    }

    public function borrarServicio($id) {
        $query = "DELETE FROM servicio WHERE id_servicio = :id";
        $stid = oci_parse($this->conn, $query);
        oci_bind_by_name($stid, ':id', $id);
        return oci_execute($stid);
    }
}
?>
